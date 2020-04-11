//
//  Logger.swift
//  
//
//  Created by Jordan Gustafson on 2/2/20.
//

import Combine

public struct Logger {
    
    private static let errorSubject: PassthroughSubject<Error, Never> = PassthroughSubject()
    
    /// Publisher that sends any errors that are logged with the logger
    public static var errorPublisher: AnyPublisher<Error, Never> {
        return errorSubject
            .eraseToAnyPublisher()
    }
    
    /// Logs an error to the console
    /// - Parameter error: The error to be logged
    public static func log(error: Error) {
        dump(error)
        errorSubject.send(error)
    }
    
}

