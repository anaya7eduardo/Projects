//
//  UserDefaults+Extension.swift
//  MondayUserDefaults2
//
//  Created by Eduardo Anaya on 12/6/21.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultKeys: String {
        case switchIsOn
        case signedInUser
    }
    
    var switchIsOn: Bool {
        get {
            bool(forKey: UserDefaultKeys.switchIsOn.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultKeys.switchIsOn.rawValue)
        }
    }
    
    var signedInUser: User? {
        get {
            if let data = object(forKey: UserDefaultKeys.signedInUser.rawValue) as? Data {
                let user = try? JSONDecoder().decode(User.self, from: data)
                return user
            }
            return nil
        }
        set {
            if newValue == nil {
                removeObject(forKey: UserDefaultKeys.signedInUser.rawValue)
            } else {
                let data = try? JSONEncoder().encode(newValue)
                setValue(data, forKey: UserDefaultKeys.signedInUser.rawValue)
            }
        }
    }
}

struct UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    var signedInUser: User {
        get {
            return User(firstName: "Tony", lastName: "Stark")
        }
        set {
            
        }
    }
}

