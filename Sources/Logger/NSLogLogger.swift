//
//  NSLogLogger.swift
//  Pods
//
//  Created by Andreas on 27.11.16.
//
//

import Foundation

public struct NSLogLogger: Logger {
    
    public let logLevel: LogLevel
    public var format: String {
        return "#FILE#.#FUNC#:#LINE# #LEVEL#: "
    }
    
    public init(logLevel: LogLevel = .error) {
        self.logLevel = logLevel
    }
    
    public func shouldLog(for level: LogLevel) -> Bool {
        
        if level >= logLevel {
            return true
        }
        
        return false
    }
    
    public func log(message: String) {
        NSLog(message)
    }
}
