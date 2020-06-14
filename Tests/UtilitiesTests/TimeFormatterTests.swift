//
//  TimeFormatterTests.swift
//  
//
//  Created by Jordan Gustafson on 6/14/20.
//

import XCTest
import Utilities

final class TimeFormatterTests: XCTestCase {
    
    func testTimeFormatter() {
        XCTAssert(TimeFormatter.timeString(time: 10) == "10")
        XCTAssert(TimeFormatter.timeString(time: 65) == "01:05")
        XCTAssert(TimeFormatter.timeString(time: 120) == "02:00")
        XCTAssert(TimeFormatter.timeString(time: 3600) == "01:00:00")
        XCTAssert(TimeFormatter.timeString(time: 3661) == "01:01:01")
    }
    
}


//MARK: - All Test Cases

extension TimeFormatterTests {
    
    static var allTests = [
        ("testTimeFormatter", testTimeFormatter)
    ]
    
}

