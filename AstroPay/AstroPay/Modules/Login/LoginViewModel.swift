//
//  LoginViewModel.swift
//  AstroPay
//
//  Created by Eduardo on 2/23/23.
//

import Foundation

protocol LoginViewModelActions {
    func login(userName: String, password: String)-> Bool
}

class LoginViewModel {
    
    let app: App
    init(app: App) {
        self.app = app
    }
    
}

extension LoginViewModel: LoginViewModelActions {
    
    // checks if valid email and password has length greater than 8 then login success
    func login(userName: String, password: String) -> Bool {
//        if userName.isValidEmail() && password.count > 7 {
//            return true
//        }
//        return false
        return userName.isValidEmail() && password.count > 7 ? true : false
    }
}
