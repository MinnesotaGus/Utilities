//
//  File.swift
//  
//
//  Created by Jordan Gustafson on 7/2/20.
//

import Foundation

/// Represents a number split into it's integer and fractional digits
public struct SplitNumber {
    
    /// The digits before the decimal point
    public let integerDigits: [Int]
    /// The digits after the decimal point
    public let fractionalDigits: [Int]
    
    /// Returns the number made up of the integer and fractional digits
    public var number: Double {
        /// Calculate the value of the integer digits
        var integerDigitsValue: Double = 0.0
        let integerDigitsCount = integerDigits.count
        if integerDigitsCount > 0 {
            // Loop through all the integer digits
            for i in 0...(integerDigitsCount - 1) {
                // Calculate the power of ten for the digit based on it's position
                let powerOfTen = pow(10, Double(integerDigitsCount - i - 1))
                // Add the digit times its' power of ten to the running value
                integerDigitsValue += Double(integerDigits[i]) * powerOfTen
            }
        }
        
        /// Calculate the value of the fractional digits
        var fractionalDigitsValue: Double = 0.0
        let fractionalDigitsCount = fractionalDigits.count
        if fractionalDigitsCount > 0 {
            // Loop through all the fractional digits
            for i in 0...(fractionalDigitsCount - 1) {
                // Loop through all the integer digits
                let powerOfTen = pow(10, Double(i + 1))
                // Add the digit divided by its' power of ten to the running value
                fractionalDigitsValue += Double(fractionalDigits[i]) / powerOfTen
            }
        }
        
        return integerDigitsValue + fractionalDigitsValue
    }
    
    /// Returns with whether or not the number has any integer digits with a non-zero value
    public var hasNonZeroIntegerDigits: Bool {
        return !integerDigits.isEmpty && integerDigits.last != 0
    }
    
    /// Returns with whether or not the number has any fractional digits with a non-zero value
    public var hasNonZeroFractionalDigits: Bool {
        return !fractionalDigits.isEmpty && fractionalDigits.first != 0
    }
    
    /// Intializes a `SplitNumber` with the given number
    /// - Parameter number: The number to generate the `SplitNumber` for
    public init(number: Double) {
        /// Convert it to a `String `
        let numberString = String(number)
        /// Split it on the decimal point
        let separated = numberString.split(separator: ".")
        
        /// Grab the integer digits, they should be first in the array
        if let integerDigitsString = separated.first, let integerDigitsValue = Int(String(integerDigitsString)) {
            integerDigits = String(describing: integerDigitsValue).compactMap { Int(String($0)) }
        } else {
            integerDigits = []
        }
        
        /// Check to see fi there are fractional digits, if there are grab them
        if separated.count > 1, let trailingRounded = Int(String(separated[1])) {
            let trailingPlaced = String(describing: trailingRounded).compactMap { Int(String($0)) }
            if trailingPlaced != [0] {
                fractionalDigits = trailingPlaced
            } else {
                fractionalDigits = []
            }
        } else {
            fractionalDigits = []
        }
    }
    
    /// Intializes a `SplitNumber` with the given integer and fractional digits
    /// - Parameters:
    ///   - integerDigits: The digits before the decimal point
    ///   - fractionalDigits: The digits after the decimal point
    public init(integerDigits: [Int], fractionalDigits: [Int]) {
        self.integerDigits = integerDigits
        self.fractionalDigits = fractionalDigits
    }
    
    /// Returns a new `SplitNumber` with  the given number added to the integer digits
    public func addingNumberToIntegerDigits(_ number: Int) -> SplitNumber {
        let fixed = integerDigits != [0] ? integerDigits : []
        return SplitNumber(integerDigits: fixed + [number], fractionalDigits: fractionalDigits)
    }
    
    /// Returns a new `SplitNumber` with  the given number added to the fractional digits
    public func addingNumberToFractionalDigits(_ number: Int) -> SplitNumber {
        let fixedInteger = integerDigits == [] ? [0] : integerDigits
        return SplitNumber(integerDigits: fixedInteger, fractionalDigits: fractionalDigits + [number])
    }
    
    /// Returns a new `SplitNumber` with the last digit deleted
    public func deletingLastDigit() -> SplitNumber {
        if !fractionalDigits.isEmpty {
            return SplitNumber(integerDigits: integerDigits, fractionalDigits: fractionalDigits.dropLast())
        } else if !integerDigits.isEmpty {
            return SplitNumber(integerDigits: integerDigits.dropLast(), fractionalDigits: [])
        } else {
            return SplitNumber(integerDigits: [], fractionalDigits: [])
        }
    }
    
}

