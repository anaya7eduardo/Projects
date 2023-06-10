//
//  StringExtensionTests.swift
//  AstroPayTests
//
//  Created by Eduardo on 2/23/23.
//

import XCTest
@testable import AstroPay

final class StringExtensionTests: XCTestCase {

    func testValidEmail()  {
        let email = "test@tester.com"
        let output = email.isValidEmail()
        
        XCTAssertTrue(output)
    }
    
    func testInvalidEmail()  {
        // when email is not correct
        let email = "testtester.com"
        let output = email.isValidEmail()
        
        XCTAssertFalse(output)
    }
    
}
