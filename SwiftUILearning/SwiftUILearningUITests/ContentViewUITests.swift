//
//  ContentViewUITests.swift
//  SwiftUILearningUITests
//
//  Created by unkn0wn on 3/2/23.
//

import XCTest

final class ContentViewUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testCheckForWelcomeText() {
        let welcomeLabel = app.staticTexts["Welcome"]
        
        XCTAssertTrue(welcomeLabel.exists)
    }
    
    func testLoginFields() {
        let emailField = app.textFields["EmailID"]
        XCTAssertTrue(emailField.exists)
        
        let passField = app.secureTextFields["Password"]
        XCTAssertTrue(passField.exists)
        
        emailField.tap()
        emailField.typeText("test@tester.com")
        
        passField.tap()
        passField.typeText("1234567")
        
//        let signUpButon = app.buttons["Log In"]
//        XCTAssertTrue(signUpButon.exists)
//
//        signUpButon.tap()
//        XCTAssertTrue(signUpButon.isEnabled)
        
        let navigateButton = app.buttons["Navigate on Button Click"]
        XCTAssertTrue(navigateButton.exists)
        
        navigateButton.tap()
        
        let swiftLabel = app.staticTexts["SwiftUI"]
        XCTAssertTrue(swiftLabel.exists)
    }
    
    func testSomeFlow() {
        let emailIdTextField = app.textFields["EmailID"]
        XCTAssertTrue(emailIdTextField.exists)
        emailIdTextField.tap()
        emailIdTextField.typeText("test@tester.com")
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        XCTAssertTrue(passwordSecureTextField.exists)
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("1234567")
        
        let loginButton = app.buttons["Log In"]
        loginButton.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        XCTAssertTrue(elementsQuery.buttons["Dec"].waitForExistence(timeout: 1.0))
        elementsQuery.buttons["Dec"].tap()
//        XCTAssertTrue(elementsQuery.buttons["Dec"].exists)
        
        let backButton = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Back"]
        backButton.tap()
        backButton.tap()
        app.buttons["Navigate on Button Click"].tap()
        backButton.tap()
        
    }
    
}
