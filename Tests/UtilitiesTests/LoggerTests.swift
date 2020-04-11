//
//  LoggerTests.swift
//  
//
//  Created by Jordan Gustafson on 4/11/20.
//

import XCTest
import Utilities
import Combine

final class LoggerTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = Set()
    
    func testErrorPublisher() {
        let error1 = MockError(localizedDescription: "Hello")
        let error2 = MockError(localizedDescription: "World")
        let publisherExpectation = expectation(description: "Waiting for values to publish")
        
        var recievedErrors: [Error] = []
        
        Logger
            .errorPublisher
            .sink(receiveValue: { error in
                recievedErrors.append(error)
                if recievedErrors.count == 4 {
                    publisherExpectation.fulfill()
                }
            })
            .store(in: &cancellables)
        
        Logger.log(error: error1)
        Logger.log(error: error2)
        Logger.log(error: error2)
        Logger.log(error: error1)
        
        wait(for: [publisherExpectation], timeout: 1.0)
        
        let mapped = recievedErrors.compactMap { $0 as? MockError }
        XCTAssert(mapped == [error1, error2, error2, error1])
        
    }
    
}


struct MockError: Error, Equatable {
    
    let localizedDescription: String
    
}

