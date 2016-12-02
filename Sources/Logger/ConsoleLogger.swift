//
//  ConsoleLogger.swift
//  Pods
//
//  Created by Andreas on 27.11.16.
//
//

import Foundation

public struct ConsoleLogger: Logger {
    
    public let logLevel: LogLevel
    
    public init(logLevel: LogLevel = .error) {
        self.logLevel = logLevel
    }
    
    public func log(message: String, with logLevel: LogLevel) {
        print(message)
    }
}
