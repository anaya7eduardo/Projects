//
//  NetworkManager.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/22/23.
//

import Foundation

class NetworkManager {
    func getDataFromURL(url:URL) async throws -> Data {
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            return data
        } catch let error {
            print(error.localizedDescription)
            throw error
        }
    }
}
