//
//  ViewModel.swift
//  CVSCode
//
//  Created by unkn0wn on 3/10/23.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var response: Response?
    
    private let net = NetworkTool()
    
    init() {
     
        download()
    }
    
    func download() {
        Task {
            do {
                
                try await downloadAsync()
                
            } catch let error {
                print("Networking Error: \(error.localizedDescription)")
            }
            
        }
    }
    
    func downloadAsync() async throws {
        
        let _response = try await net.download()
        
        await MainActor.run {
            self.response = _response
        }
        
    }
    
}
