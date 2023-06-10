//
//  NetworkManager.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 2/23/23.
//

import Foundation

protocol Networkable {
    func getDataFromURL(url:URL) async throws -> Data
}

class NetworkManager: Networkable {
    func getDataFromURL(url:URL) async throws -> Data {
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        } catch let error {
            print(error.localizedDescription)
            throw NetworkError.dataNotFoundError
        }
    }
}
