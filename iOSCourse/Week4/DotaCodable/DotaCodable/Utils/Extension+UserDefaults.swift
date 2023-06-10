//
//  Extension+UserDefaults.swift
//  DotaCodable
//
//  Created by Eduardo Anaya on 12/7/21.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultKeys: String {
        case boolArray
    }
    
    var boolArray:[Any]? {
        get {
            array(forKey: UserDefaultKeys.boolArray.rawValue)
        }
        set {
            set(newValue, forKey: UserDefaultKeys.boolArray.rawValue)
        }
    }
    
}
