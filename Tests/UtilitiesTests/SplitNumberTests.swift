//
//  SplitNumberTests.swift
//  
//
//  Created by Jordan Gustafson on 7/2/20.
//

import XCTest
import Utilities

final class SplitNumberTests: XCTestCase {
    
    func testInit() {
        let zeroSplit = SplitNumber(number: 0.0)
        XCTAssert(zeroSplit.integerDigits == [0])
        XCTAssert(zeroSplit.fractionalDigits == [])
        
        let someNumberSplit = SplitNumber(number: 34.873)
        XCTAssert(someNumberSplit.integerDigits == [3, 4])
        XCTAssert(someNumberSplit.fractionalDigits == [8, 7, 3])
    }
    
    func testDelete() {
        var splitNumber = SplitNumber(integerDigits: [1, 2, 3], fractionalDigits: [3, 2, 1])
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [1, 2, 3])
        XCTAssert(splitNumber.fractionalDigits == [3, 2])
        XCTAssert(splitNumber.number == 123.32)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [1, 2, 3])
        XCTAssert(splitNumber.fractionalDigits == [3])
        XCTAssert(splitNumber.number == 123.3)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [1, 2, 3])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 123.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [1, 2])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 12.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [1])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 1.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 0.0)
    }
    
    func testSampleInputOne() {
        var splitNumber = SplitNumber(number: 0)
        
        splitNumber = splitNumber.addingNumberToIntegerDigits(2)
        XCTAssert(splitNumber.integerDigits == [2])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 2.0)
        
        splitNumber = splitNumber.addingNumberToIntegerDigits(9)
        XCTAssert(splitNumber.integerDigits == [2, 9])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 29.0)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(5)
        XCTAssert(splitNumber.integerDigits == [2, 9])
        XCTAssert(splitNumber.fractionalDigits == [5])
        XCTAssert(splitNumber.number == 29.5)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [2, 9])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 29.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [2])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 2.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 0.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 0.0)
        
        splitNumber = splitNumber.addingNumberToIntegerDigits(4)
        XCTAssert(splitNumber.integerDigits == [4])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 4.0)
        
        splitNumber = splitNumber.addingNumberToIntegerDigits(4)
        XCTAssert(splitNumber.integerDigits == [4, 4])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 44.0)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(1)
        XCTAssert(splitNumber.integerDigits == [4, 4])
        XCTAssert(splitNumber.fractionalDigits == [1])
        XCTAssert(splitNumber.number == 44.1)

        splitNumber = splitNumber.addingNumberToFractionalDigits(0)
        XCTAssert(splitNumber.integerDigits == [4, 4])
        XCTAssert(splitNumber.fractionalDigits == [1, 0])
        XCTAssert(splitNumber.number == 44.10)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(5)
        XCTAssert(splitNumber.integerDigits == [4, 4])
        XCTAssert(splitNumber.fractionalDigits == [1, 0, 5])
        XCTAssert(splitNumber.number == 44.105)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [4, 4])
        XCTAssert(splitNumber.fractionalDigits == [1, 0])
        XCTAssert(splitNumber.number == 44.10)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [4, 4])
        XCTAssert(splitNumber.fractionalDigits == [1])
        XCTAssert(splitNumber.number == 44.1)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [4, 4])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 44.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [4])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 4.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 0.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 0.0)
    }
    
    
    func testSampleInputTwo() {
        var splitNumber = SplitNumber(number: 0)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(0)
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0])
        XCTAssert(splitNumber.number == 0.0)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(1)
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0 , 1])
        XCTAssert(splitNumber.number == 0.01)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(0)
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0, 1, 0])
        XCTAssert(splitNumber.number == 0.010)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(0)
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0, 1, 0, 0])
        XCTAssert(splitNumber.number == 0.0100)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(0)
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0, 1, 0, 0, 0])
        XCTAssert(splitNumber.number == 0.01000)
        
        splitNumber = splitNumber.addingNumberToFractionalDigits(5)
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0, 1, 0, 0, 0, 5])
        XCTAssert(splitNumber.number == 0.010005)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0, 1, 0, 0, 0])
        XCTAssert(splitNumber.number == 0.01000)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0, 1, 0, 0])
        XCTAssert(splitNumber.number == 0.0100)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0, 1, 0])
        XCTAssert(splitNumber.number == 0.010)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0 , 1])
        XCTAssert(splitNumber.number == 0.01)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [0])
        XCTAssert(splitNumber.number == 0.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [0])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 0.0)
        
        splitNumber = splitNumber.deletingLastDigit()
        XCTAssert(splitNumber.integerDigits == [])
        XCTAssert(splitNumber.fractionalDigits == [])
        XCTAssert(splitNumber.number == 0.0)
    }
    
}

