//
//  Logger.swift
//  
//
//  Created by Jordan Gustafson on 2/2/20.
//

public struct Logger {
    
    public static let shared: Logger = Logger()
    
    public func log(message: String) {
        print(message)
    }
    
}

