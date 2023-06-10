//
//  NetworkManager.swift
//  CoolWeather
//
//  Created by Eduardo Reyes on 6/8/23.
//

import Combine
import Foundation

protocol Networkable {
    func getDataFromURL<T:Decodable>(url: URL, type: T.Type) -> AnyPublisher<T,Error>
}

//class NetworkManager: Networkable {
//    func getDataFromURL<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: T.self, decoder: JSONDecoder())
//            .eraseToAnyPublisher()
//    }
//}

//class NetworkManager: Networkable {
//    func getDataFromURL<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .mapError { $0 as Error }
//            .flatMap { data, _ -> AnyPublisher<T, Error> in
//                Just(data)
//                    .decode(type: T.self, decoder: JSONDecoder())
//                    .mapError { error -> Error in
//                        if let decodingError = error as? DecodingError {
//                            print("Decoding error: \(decodingError)")
//                        } else {
//                            print("Unknown error: \(error)")
//                        }
//                        return error
//                    }
//                    .eraseToAnyPublisher()
//            }
//            .eraseToAnyPublisher()
//    }
//}

class NetworkManager: Networkable {
    func getDataFromURL<T>(url: URL, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.APIError
                }
                if httpResponse.statusCode != 200 {
                    throw NetworkError.APIError
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error -> Error in
                if let decodingError = error as? DecodingError {
                    print("Decoding error: \(decodingError)")
                    return NetworkError.parsingError
                } else {
                    print("Unknown error: \(error)")
                    return error
                }
            }
            .eraseToAnyPublisher()
    }
}
