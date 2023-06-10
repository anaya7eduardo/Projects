//
//  EmployeeViewModelTests.swift
//  SwiftUILearningTests
//
//  Created by unkn0wn on 3/1/23.
//

import XCTest
@testable import SwiftUILearning

final class EmployeeViewModelTests: XCTestCase {

    var employeeViewModel: EmployeeViewModel!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setUpWithError")
        employeeViewModel = EmployeeViewModel(networkable: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("tearDownWithError")
        employeeViewModel = nil
    }
    
    func testEmployee_GetEmployeeList() async {
        print("testEmployee_GetEmployeeList")
        XCTAssertNotNil(employeeViewModel)
        
        await employeeViewModel.getEmployeeList(urlString: "EmployeeSampleData")
        
        let expectation = XCTestExpectation(description: "Fetching Employee List")
        let duration = 5.0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            XCTAssertEqual(self.employeeViewModel.employeeList.count, 86)
            XCTAssertNil(self.employeeViewModel.customError)
        
            let firstEmployee = self.employeeViewModel.employeeList.first
            
            XCTAssertEqual(firstEmployee?.firstName, "Maggie")
            expectation.fulfill()
        }
//        wait(for: [expectation], timeout: duration)
    }
    
    func testGetEmployeeList_When_Url_Is_Not_Specified() async {
        let newViewModel = await EmployeeViewModel(networkable: FakeNetworkManager())
        XCTAssertNotNil(newViewModel)
                        
        await newViewModel.getEmployeeList(urlString: "")
        
        let empList = await newViewModel.employeeList
        XCTAssertEqual(empList.count, 0)
        
        let localError = await newViewModel.customError
        XCTAssertNotNil(localError)
        XCTAssertEqual(localError, NetworkError.invalidURL)
    }
    
    func testGetEmployeeList_When_APIFailure() async {
        let newViewModel = await EmployeeViewModel(networkable: FakeNetworkManager())
        XCTAssertNotNil(newViewModel)
                        
        await newViewModel.getEmployeeList(urlString: "EmployeeNoData")
        
        let empList = await newViewModel.employeeList
        XCTAssertEqual(empList.count, 0)
        
        let localError = await newViewModel.customError
        XCTAssertNotNil(localError)
        XCTAssertEqual(localError, NetworkError.parsingError)
    }
    
    func testGetEmployeeList_When_URL_Is_Incorrect() async {
        let newViewModel = await EmployeeViewModel(networkable: FakeNetworkManager())
        XCTAssertNotNil(newViewModel)
                        
        await newViewModel.getEmployeeList(urlString: "EmplSamplData777")
        
        let empList = await newViewModel.employeeList
        XCTAssertEqual(empList.count, 0)
        
        let localError = await newViewModel.customError
//        XCTAssertNotNil(localError)
//        XCTAssertEqual(localError, NetworkError.parsingError)
    }

}
