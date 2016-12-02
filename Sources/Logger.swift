//
//  Loger.swift
//  Pods
//
//  Created by Andreas on 27.11.16.
//
//

import Foundation

public protocol Logger {
    var logLevel: LogLevel { get }
    var format: MessageFormat { get }
        
    func shouldLog(for level: LogLevel) -> Bool
    func log(message: String, with logLevel: LogLevel)
}

public extension Logger {
    
    public var format: MessageFormat {
        return MessageFormat.default
    }
    
    public func shouldLog(for level: LogLevel) -> Bool {
        
        if level >= logLevel {
            return true
        }
        
        return false
    }
}
