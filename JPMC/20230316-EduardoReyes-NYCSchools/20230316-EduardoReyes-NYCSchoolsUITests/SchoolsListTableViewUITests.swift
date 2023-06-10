//
//  SchoolsListTableViewUITests.swift
//  20230316-EduardoReyes-NYCSchoolsUITests
//
//  Created by unkn0wn on 3/17/23.
//

import XCTest

final class SchoolsListTableViewUITests: XCTestCase {
    
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
    
    func test_SchoolsListTextLabelsExistence() {
        let tablesQuery = app.tables
        
        let epicHighSchool = tablesQuery.cells.staticTexts["Women's Academy of Excellence"]
        XCTAssertTrue(epicHighSchool.exists)
        epicHighSchool.tap()
        
        let mathSATTextField = app.staticTexts["Math SAT:"]
        XCTAssertTrue(mathSATTextField.exists)
        
        let readingSATTextField = app.staticTexts["Reading SAT:"]
        XCTAssertTrue(readingSATTextField.exists)
        
        let writingSATTextField = app.staticTexts["Writing SAT:"]
        XCTAssertTrue(writingSATTextField.exists)
    }
    
}
