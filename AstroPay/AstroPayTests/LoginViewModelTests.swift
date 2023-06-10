//
//  LoginViewModelTests.swift
//  AstroPayTests
//
//  Created by Eduardo on 2/23/23.
//

import XCTest
@testable import AstroPay

final class LoginViewModelTests: XCTestCase {

    let loginViewModel = LoginViewModel()

    func testLoginSuccess() {
        let email = "test@tester.com"
        let password = "12345678"
        let output = loginViewModel.login(userName: email, password: password)
        
        XCTAssertTrue(output)
    }

    func testEmailLoginFailure()  {
        // when email is not correct
        let email = "testtester.com"
        let password = "12345678"
        let output = loginViewModel.login(userName: email, password: password)
        
        XCTAssertFalse(output)
    }

    func testPasswordLoginFailure()  {
        // when password is not correct
        let email = "test@tester.com"
        let password = "123456"
        let output = loginViewModel.login(userName: email, password: password)
        
        XCTAssertFalse(output)
    }
    
}
