//
//  NetworkTool.swift
//  CVSCode
//
//  Created by unkn0wn on 3/10/23.
//

import Foundation

class NetworkTool {
    
    func download() async throws -> Response {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-1.json") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession(configuration: .default).data(from: url)
        
        print("received \(data.count) bytes")
        
        let response = try JSONDecoder().decode(Response.self, from: data)
        
        print("Rez: \(response)")
        
        return response
    }
    
}
