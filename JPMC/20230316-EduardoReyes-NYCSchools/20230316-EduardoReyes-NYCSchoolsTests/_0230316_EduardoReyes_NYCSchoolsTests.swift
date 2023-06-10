//
//  _0230316_EduardoReyes_NYCSchoolsTests.swift
//  20230316-EduardoReyes-NYCSchoolsTests
//
//  Created by unkn0wn on 3/16/23.
//

import XCTest
@testable import _0230316_EduardoReyes_NYCSchools

final class _0230316_EduardoReyes_NYCSchoolsTests: XCTestCase {
    
    private let schoolListViewModel = SchoolListViewModel(networkManager: NetworkManager())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testModelWithS() {
        let sat = SATInfo(dbn: "123",
                          schoolName: "Little Lamb High School",
                          numOfSatTestTakers: "1000",
                          satCriticalReadingAvgScore: "S",
                          satMathAvgScore: "S",
                          satWritingAvgScore: "S")
        
        let math = schoolListViewModel.toNumbFromString(string: sat.satMathAvgScore)
        let reading = schoolListViewModel.toNumbFromString(string: sat.satCriticalReadingAvgScore)
        let writing = schoolListViewModel.toNumbFromString(string: sat.satWritingAvgScore)
        
        XCTAssertEqual(math, "0")
        XCTAssertEqual(reading, "0")
        XCTAssertEqual(writing, "0")
        
        print("yaay, we're done")
    }
    
    func testModelWithInt() {
        let sat = SATInfo(dbn: "123",
                          schoolName: "Big Lamb High School",
                          numOfSatTestTakers: "1000",
                          satCriticalReadingAvgScore: "400",
                          satMathAvgScore: "400",
                          satWritingAvgScore: "400")
        
        let math = schoolListViewModel.toNumbFromString(string: sat.satMathAvgScore)
        let reading = schoolListViewModel.toNumbFromString(string: sat.satCriticalReadingAvgScore)
        let writing = schoolListViewModel.toNumbFromString(string: sat.satWritingAvgScore)
        
        XCTAssertEqual(math, "400")
        XCTAssertEqual(reading, "400")
        XCTAssertEqual(writing, "400")
        
        print("yaay, we're done")
    }
    
    func testModelWithInvalid() {
        let sat = SATInfo(dbn: "123",
                          schoolName: "Strange Lamb High School",
                          numOfSatTestTakers: "1000",
                          satCriticalReadingAvgScore: "Help",
                          satMathAvgScore: "Me",
                          satWritingAvgScore: "Out")
        
        let math = schoolListViewModel.toNumbFromString(string: sat.satMathAvgScore)
        let reading = schoolListViewModel.toNumbFromString(string: sat.satCriticalReadingAvgScore)
        let writing = schoolListViewModel.toNumbFromString(string: sat.satWritingAvgScore)
        
        XCTAssertEqual(math, "0")
        XCTAssertEqual(reading, "0")
        XCTAssertEqual(writing, "0")
        
        print("yaay, we're done")
    }

}
