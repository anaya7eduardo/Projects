//
//  FakeNetworkManager.swift
//  SwiftUILearningTests
//
//  Created by unkn0wn on 3/9/23.
//

import Foundation
@testable import SwiftUILearning

class FakeNetworkManager: Networkable {
    func getDataFromURL(url: URL) async throws -> Data {
//        return Data()
        do {
//            let (data,_) = try await URLSession.shared.data(from: url)
            let bundle = Bundle(for: FakeNetworkManager.self)
            guard let path = bundle.url(forResource: url.absoluteString, withExtension: "json") else {
                throw NetworkError.invalidURL
            }
            let data = try Data(contentsOf: path)
            return data
        } catch let error {
            print(error.localizedDescription)
            throw NetworkError.dataNotFoundError
        }
    }
}
