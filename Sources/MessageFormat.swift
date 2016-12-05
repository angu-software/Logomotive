//
//  MessageFormat.swift
//  Pods
//
//  Created by Andreas on 02.12.16.
//
//

import Foundation

public struct MessageFormat: CustomStringConvertible {
    
    // "#DATE# [#EXECUTABLE#] #FILE#.#FUNC#:#LINE# #LEVEL#: "
    
    public static var `default`: MessageFormat {
        return MessageFormat().dateTime.space.string("[").executable.string("]").space.file.string(".").function.string(":").line.space.logLevel.string(":").space
    }
    
    private let formatString: String
    
    public init() {
        self.init("")
    }
    
    private init(_ formatString: String) {
        self.formatString = formatString
    }
    
    public var dateTime: MessageFormat {
        return string("#DATE#")
    }
    
    public var executable: MessageFormat {
        return string("#EXECUTABLE#")
    }
    
    public var file: MessageFormat {
        return string("#FILE#")
    }
    
    public var function: MessageFormat {
        return string("#FUNC#")
    }
    
    public var line: MessageFormat {
        return string("#LINE#")
    }
    
    public var logLevel: MessageFormat {
        return string("#LEVEL#")
    }
    
    public var space: MessageFormat {
        return string(" ")
    }
    
    public func string(_ text: String) -> MessageFormat {
        return MessageFormat(formatString + text)
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        return formatString
    }
}
