//
//  FileLogger.swift
//  Pods
//
//  Created by Andreas on 27.11.16.
//
//

import Foundation
import os.log

public enum LogFileSize {
    case byte(Double)
    case kByte(Double)
    case mByte(Double)
    case gByte(Double)
}

public struct FileLogger: Logger {
    
    public static var maxFileSize: LogFileSize = .mByte(50)
    
    private let fileURL: URL

    public var logLevel: LogLevel
    
    public init(logLevel: LogLevel) {
        self.init(logLevel: logLevel, fileURL: URL.detaultLogFileURL())
    }
    
    public init(logLevel: LogLevel, fileURL: URL) {
        self.logLevel = logLevel
        self.fileURL = fileURL
    }
    
    public func log(message: String, with logLevel: LogLevel) {
        
        if !FileManager.default.fileExists(atPath: fileURL.absoluteString) {
            FileManager.default.createFile(atPath: fileURL.absoluteString, contents: nil, attributes: nil)
        }
        
        ensureFileSize(of: FileLogger.maxFileSize)
        
        try! message.appendLine(to: fileURL) // TODO: Error handling
    }
    
    private func ensureFileSize(of fileSize: LogFileSize) {
        // TODO: ensure log file size
    }
}

fileprivate extension String {
    func appendLine(to fileURL: URL) throws {
        try (self + "\n").append(to: fileURL)
    }
    
    func append(to fileURL: URL) throws {
        let data = self.data(using: String.Encoding.utf8)!
        try data.append(to: fileURL)
    }
}

fileprivate extension Data {
    func append(to fileURL: URL) throws {
        if let fileHandle = FileHandle(forWritingAtPath: fileURL.path) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.write(self)
        }
        else {
            try write(to: fileURL, options: .atomic)
        }
    }
}

fileprivate extension URL {
    static func detaultLogFileURL() -> URL {
        
        guard let defaultURLDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else {
            return URL(fileURLWithPath: "")
        }
        let defaultFileName = Bundle.main.executableName + ".log"
        
        return defaultURLDirectory.appendingPathComponent(defaultFileName)
    }
}
