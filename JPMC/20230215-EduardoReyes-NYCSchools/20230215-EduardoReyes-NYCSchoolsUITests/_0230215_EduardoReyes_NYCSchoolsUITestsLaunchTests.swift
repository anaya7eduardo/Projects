//
//  _0230215_EduardoReyes_NYCSchoolsUITestsLaunchTests.swift
//  20230215-EduardoReyes-NYCSchoolsUITests
//
//  Created by unkn0wn on 2/15/23.
//

import XCTest

final class _0230215_EduardoReyes_NYCSchoolsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
