//
//  FileLogger.swift
//  Pods
//
//  Created by Andreas on 27.11.16.
//
//

import Foundation

public struct FileLogger: Logger {
    
    public var logLevel: LogLevel
    public var format: String {
        return "#DATE# [#EXECUTABLE#] #FILE#.#FUNC#:#LINE# #LEVEL#: "
    }
    
    let filePath: String
    
    public init(logLevel: LogLevel) {
        self.init(logLevel: logLevel, filePath: "")
    }
    
    public init(logLevel: LogLevel, filePath: String) {
        self.filePath = filePath
        self.logLevel = logLevel
    }
    
    public func shouldLog(for level: LogLevel) -> Bool {
        return level >= logLevel
    }
    
    public func log(message: String) {
        print("\(message) >> \(filePath)")
    }
    
}
