//
//  IntExtensionsTest.swift
//  PresentationLayerTests
//
//  Created by Duy Le on 20/6/2024.
//

import XCTest
@testable import PresentationLayer

final class IntExtensionsTest: XCTestCase {
    
    var timeInSeconds: Int!

    func testTimeWithAbsLargerThan5Minutes() {
        timeInSeconds = 500
        XCTAssertEqual(timeInSeconds.toTimeString(), "9m")
        
        timeInSeconds = -500
        XCTAssertEqual(timeInSeconds.toTimeString(), "-9m")
    }
    
    func testTimeWithAbsEqual5Minutes() {
        timeInSeconds = 60 * 5
        XCTAssertEqual(timeInSeconds.toTimeString(), "5m")
        
        timeInSeconds = -60 * 5
        XCTAssertEqual(timeInSeconds.toTimeString(), "-5m")
    }
    
    func testTimeWithAbsLessThan5MinutesButLargerThan1Minute() {
        timeInSeconds = 60 * 3 + 5
        XCTAssertEqual(timeInSeconds.toTimeString(), "3m 5s")
        
        timeInSeconds = -60 * 3 - 5
        XCTAssertEqual(timeInSeconds.toTimeString(), "-3m 5s")
    }
    
    func testTimeWithAbsLessThan1Minute() {
        timeInSeconds = 58
        XCTAssertEqual(timeInSeconds.toTimeString(), "58s")
        
        timeInSeconds = -30
        XCTAssertEqual(timeInSeconds.toTimeString(), "-30s")
    }

}
