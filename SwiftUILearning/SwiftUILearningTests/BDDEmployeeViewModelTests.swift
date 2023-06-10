//
//  BDDEmployeeViewModelTests.swift
//  SwiftUILearningTests
//
//  Created by unkn0wn on 3/3/23.
//

import Foundation
import Nimble //Matcher Framework
import Quick //Main Framework
@testable import SwiftUILearning

/*
 describe("The EmployeeViewModel") { //any class or struct or viewmodel name
    context("We are testing in assumption that we get data from API but we are mocking it using json file") {
        // this is under which situation you are checking whole scenario
        beforeEach {
            //
        }
        afterEach {
            //
        }
        it("My first BDD Test") {
            //
        }
    }
 }
 */

class BDDEmployeeViewModelTests: QuickSpec {
    
    override func spec() {
        describe("The 'EmployeeViewModel'") {
            context("We are testing in assumption that we get data not from API but we are mocking it using json file") {
                beforeEach {
                    //
                }
                
                afterEach {
                    //
                }
                
                it("We are expecting employee list when we call getEmployeeList function and when everything happens good") {
                    let employeeViewModel = await EmployeeViewModel(networkable: FakeNetworkManager())
                    
                    await employeeViewModel.getEmployeeList(urlString: "EmployeeSampleData")
                    
                    let employeeList = await employeeViewModel.employeeList
                    expect(employeeList.count).to(equal(86))
                    
                    let myError = await employeeViewModel.customError
                    expect(myError).to(beNil())
                }
                
                it("We are checking getEmployeeList function When_Url_isNotSpecified and then we shouldn't get data and error should occur") {
                    let employeeViewModel = await EmployeeViewModel(networkable: FakeNetworkManager())
                    
                    await employeeViewModel.getEmployeeList(urlString: "")
                    
                    let employeeList = await employeeViewModel.employeeList
                    expect(employeeList.count).to(equal(0))
                    
                    let myError = await employeeViewModel.customError
                    expect(myError).to(equal(NetworkError.invalidURL))
                }
                
                it("We are checking getEmployeeList function When_Url_isCorrect and API fails to give us data and then we shouldn't get data and error should occur") {
                    let employeeViewModel = await EmployeeViewModel(networkable: FakeNetworkManager())
                    
                    await employeeViewModel.getEmployeeList(urlString: "EmployeeNoData")
                    
                    let employeeList = await employeeViewModel.employeeList
                    expect(employeeList.count).to(equal(0))
                    
                    let myError = await employeeViewModel.customError
                    expect(myError).to(equal(NetworkError.parsingError))
                }
                
                it("We are expecting employee list when we call getEmployeeList function and we are checking wether last object is correct or not and error should be nil") {
                    let employeeViewModel = await EmployeeViewModel(networkable: FakeNetworkManager())
                    
                    await employeeViewModel.getEmployeeList(urlString: "EmployeeSampleData")
                    
                    let employeeList = await employeeViewModel.employeeList
                    let lastEmployee = employeeList.last
                    expect(lastEmployee?.firstName).to(equal("Maggie"))
                    expect(lastEmployee?.avatar).to(equal("https://randomuser.me/api/portraits/women/21.jpg"))
                    expect(lastEmployee?.createdAt).to(equal("2023-02-01T19:18:11.070Z"))
                    
                    let myError = await employeeViewModel.customError
                    expect(myError).to(beNil())
                }
            }
        }
    }
    
}
