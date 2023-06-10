//
//  App.swift
//  AstroPay
//
//  Created by Eduardo on 2/28/23.
//

import Foundation
import Combine

class App {
    
    let updatePublisher = PassthroughSubject<Void, Never>()
    
    let datamanager = DataManager()
    
    init() {
        
        Task {
            await datamanager.loadPersistentStores()
            
            await MainActor.run {
                updatePublisher.send()
            }
            
        }
        
    }
    
    func save(username: String?) {
        if let username = username {
            
            Task {
                do {
                    try await datamanager.save(username: username)
                } catch let error {
                    print("save username task error: \(error.localizedDescription)")
                }
            }
            
        }
    }
    
    func save(forUsername username: String?, password: String?) {
        if let username = username {
            if let password = password {
                
                do {
                    try Keychain.saveData(forAccount: username, dataString: password)
                } catch let error {
                    print("save password error: \(error.localizedDescription)")
                }
                
            }
        }
    }
    
}
