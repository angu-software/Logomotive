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
    var format: String { get }
    
    init(logLevel: LogLevel)
    
    func shouldLog(for level: LogLevel) -> Bool
    func log(message: String)
}
