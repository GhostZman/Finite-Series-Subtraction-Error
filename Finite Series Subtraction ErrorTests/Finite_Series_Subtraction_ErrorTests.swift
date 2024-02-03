//
//  Finite_Series_Subtraction_ErrorTests.swift
//  Finite Series Subtraction ErrorTests
//
//  Created by Phys440Zachary on 1/26/24.
//

import XCTest

final class Finite_Series_Subtraction_ErrorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let mySeriesCalculator = SeriesElement()
        
        let series1Result = await mySeriesCalculator.series1Element(N: 1).1
        XCTAssertEqual(series1Result, 0.1667, accuracy:1.0E-3, "Was not equal to this resolution.")
    }
    
    func testExample2() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let mySeriesCalculator = SeriesElement()
        
        let series2Result = await mySeriesCalculator.series2Element(N: 1).1
        XCTAssertEqual(series2Result, 0.1667, accuracy:1.0E-3, "Was not equal to this resolution.")
    }
    
    func testExample3() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let mySeriesCalculator = SeriesElement()
        
        let series3Result = await mySeriesCalculator.series3Element(N: 1).1
        XCTAssertEqual(series3Result, 0.1667, accuracy:1.0E-3, "Was not equal to this resolution.")
    }

    func testThreaded() async throws {
        let allSeriesCalculator = FiniteSeries()
        
        allSeriesCalculator.computeSeries(N: 10)
        
        sleep(2)
        XCTAssertEqual(allSeriesCalculator.series1Result, 0.28360954, accuracy:1.0E-5, "Was not equal to this resolution.")
        XCTAssertEqual(allSeriesCalculator.series2Result, 0.28360954, accuracy:1.0E-5, "Was not equal to this resolution.")
        XCTAssertEqual(allSeriesCalculator.series3Result, 0.28360954, accuracy:1.0E-5, "Was not equal to this resolution.")
        
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
