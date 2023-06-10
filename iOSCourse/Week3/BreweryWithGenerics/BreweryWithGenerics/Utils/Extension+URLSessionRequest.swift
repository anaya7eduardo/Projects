//
//  Extension+URLSessionRequest.swift
//  BreweryWithGenerics
//
//  Created by Eduardo Anaya on 12/2/21.
//

import Foundation

extension URLSession {
    /*
     Here We Are Extending URLSession By Adding A Generic Networking Call Func That Does Not Worry About Classes. The Only Thing It Cares About Whatever Is Passed In Conforms To The Codable Protocol.
     */
    func getRequest<T:Codable>(url: URL?, decoding: T.Type, completion: @escaping(Result<T, Error>)->()) {
        guard let url = url else {
            completion(.failure(RequestErrors.badURL))
            return
        }
        
        let task = self.dataTask(with: url) { data, _, error in
            guard data != nil else {
                completion(.failure(RequestErrors.badData))
                return
            }
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let JSONResult = try JSONDecoder().decode(decoding, from: data!)
                completion(.success(JSONResult))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
