//
//  RegisterViewModel.swift
//  AstroPay
//
//  Created by Eduardo on 2/24/23.
//

import Foundation

protocol RegisterViewModelActions {
    func register(firstName: String, lastName: String, userName: String, password: String) -> Bool
}

class RegisterViewModel {
    
}

extension RegisterViewModel: RegisterViewModelActions {
    func register(firstName: String, lastName: String, userName: String, password: String) -> Bool {
        if firstName.count > 2 && lastName.count > 2 && userName.isValidEmail() && password.count > 7 {
            // check if firstName and lastName has length greater than 2, is valid email and password has length greater than 7 then registration success
            return true
        }
        return false
    }
}
