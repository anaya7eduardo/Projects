//
//  Profile.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import Foundation

struct Profile {
    let name: String
    let email: String
    let avatar: String
}

extension Profile {
    static func getMockProfile() -> Profile {
        return Profile(name:"John Doe", email:"john.doe@gmail.com", avatar:"test")
    }
}
