//
//  DataManager.swift
//  AstroPay
//
//  Created by unkn0wn on 2/27/23.
//

import Foundation
import CoreData

public class DataManager {
    
    let container: NSPersistentContainer
    
    public required init() {
        container = NSPersistentContainer(name: "AstroPay")
    }
    
    public func loadPersistentStores() async {
        await withCheckedContinuation { continuation in
            container.loadPersistentStores { description, error in
                if let error = error {
                    print("Load Persistent Stores Error: \(error.localizedDescription)")
                }
                continuation.resume()
            }
        }
    }
    
    public func save(username: String) async throws {
        let context = container.viewContext
        try await context.perform {
            let fetchRequest = UserInfo.fetchRequest()
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                user.userEmail = username
            } else {
                let user = UserInfo(context: context)
                user.userEmail = Crypt.encrypt(string: username)
            }
            try context.save()
        }
    }
    
    public func fetchUsername() async throws -> String? {
        let context = container.viewContext
        var results = [UserInfo]()
        try await context.perform {
            let fetchRequest = UserInfo.fetchRequest()
            results = try context.fetch(fetchRequest)
        }
        
        if let first = results.first {
            if let result = first.userEmail {
                return Crypt.decrypt(string: result)
            }
        }
        return nil
    }
    
}
