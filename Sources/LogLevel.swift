//
//  LogLevel.swift
//  Pods
//
//  Created by Andreas on 27.11.16.
//
//

import Foundation

public enum LogLevel: Int, Comparable, CustomStringConvertible {
    
    case debug   = 0
    case info    = 1
    case warning = 2
    case error   = 3
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        switch self {
        case .debug:
            return "DEBUG"
        case .info:
            return "INFO"
        case .warning:
            return "WARNING"
        case .error:
            return "ERROR"
        }
    }
    
    // MARK: -Comparable
    
    public static func ==(lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
    
    public static func <(lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    public static func <=(lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue <= rhs.rawValue
    }
    
    public static func >=(lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue >= rhs.rawValue
    }
    
    public static func >(lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }
}

