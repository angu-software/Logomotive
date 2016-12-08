//
//  MessageFormat.swift
//  Pods
//
//  Created by Andreas on 02.12.16.
//
//

import Foundation

public struct MessageFormat: Equatable, CustomStringConvertible {
    
    //
    
    public static let `default`: MessageFormat = {
        return MessageFormat().dateTime.space.string("[").executable.string("]").space.file.string(".").function.string(":").line.space.logLevel.string(":").space
    }()
    
    private let formatString: String
    
    public var dateTime: MessageFormat {
        return append("#DATE#")
    }
    
    public var executable: MessageFormat {
        return append("#EXEC#")
    }
    
    public var file: MessageFormat {
        return append("#FILE#")
    }
    
    public var function: MessageFormat {
        return append("#FUNC#")
    }
    
    public var line: MessageFormat {
        return append("#LINE#")
    }
    
    public var logLevel: MessageFormat {
        return append("#LEVEL#")
    }
    
    public var space: MessageFormat {
        return append(" ")
    }
    
    public func string(_ text: String) -> MessageFormat {
        return append(text)
    }
    
    public init() {
        self.init("")
    }
    
    private init(_ formatString: String) {
        self.formatString = formatString
    }
    
    private func append(_ format: String) -> MessageFormat {
        return MessageFormat(formatString + format)
    }
    
    // MARK: Equitable
    
    public static func ==(lhs: MessageFormat, rhs: MessageFormat) -> Bool {
        return lhs.formatString == rhs.formatString
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return formatString
    }
}
