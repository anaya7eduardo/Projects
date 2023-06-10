//
//  RegisterViewModelTests.swift
//  AstroPayTests
//
//  Created by Eduardo on 2/24/23.
//

import XCTest
@testable import AstroPay

final class RegisterViewModelTests: XCTestCase {
    
    let registerViewModel = RegisterViewModel()
    
    func testRegisterSuccess() {
        let firstName = "John"
        let lastName = "Doe"
        let email = "test@tester.com"
        let password = "12345678"
        
        let output = registerViewModel.register(firstName: firstName, lastName: lastName, userName: email, password: password)
        
        XCTAssertTrue(output)
    }
    
    func testFirstNameRegisterFailure() {
        // when firstName is not correct
        let firstName = "J"
        let lastName = "Doe"
        let email = "test@tester.com"
        let password = "12345678"
        
        let output = registerViewModel.register(firstName: firstName, lastName: lastName, userName: email, password: password)
        
        XCTAssertFalse(output)
    }
    
    func testLastNameRegisterFailure() {
        // when lastName is not correct
        let firstName = "John"
        let lastName = "D"
        let email = "test@tester.com"
        let password = "12345678"
        
        let output = registerViewModel.register(firstName: firstName, lastName: lastName, userName: email, password: password)
        
        XCTAssertFalse(output)
    }
    
    func testEmailRegisterFailure() {
        // when email is not correct
        let firstName = "John"
        let lastName = "Doe"
        let email = "testtester.com"
        let password = "12345678"
        
        let output = registerViewModel.register(firstName: firstName, lastName: lastName, userName: email, password: password)
        
        XCTAssertFalse(output)
    }
    
    func testPasswordRegisterFailure() {
        // when password is not correct
        let firstName = "John"
        let lastName = "Doe"
        let email = "test@tester.com"
        let password = "123456"
        
        let output = registerViewModel.register(firstName: firstName, lastName: lastName, userName: email, password: password)
        
        XCTAssertFalse(output)
    }
    
}
