//
//  NetworkManager.swift
//  
//
//  Created by unkn0wn on 3/23/23.
//

import Foundation

public class NetworkManager {
    public init() {
        
    }
    
    public func download() {
        guard let url = URL(string: "https://www.google.com/") else { print("Could not form URL"); return }
        Task {
            do {
                let (data, _) = try await URLSession(configuration: .default).data(from: url)
                print("Downloaded \(data.count) bytes from Google")
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
