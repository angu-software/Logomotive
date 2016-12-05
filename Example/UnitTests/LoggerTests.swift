//
//  LoggerTests.swift
//  Logomotive
//
//  Created by Andreas on 03.12.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Logomotive
import Quick
import Nimble

class LoggerTestConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples("should log") { (sharedExampleContext: @escaping SharedExampleContext) in
            it("log if its logLevel is less or equal to passed logLevel") {
                let logger = sharedExampleContext()["logger"] as? Logger
                expect(logger?.shouldLog(for: .debug)).to(beTrue())
                expect(logger?.shouldLog(for: .info)).to(beTrue())
                expect(logger?.shouldLog(for: .warning)).to(beTrue())
                expect(logger?.shouldLog(for: .error)).to(beTrue())
            }
        }
        sharedExamples("should not log") { (sharedExampleContext: @escaping SharedExampleContext) in
            it("if its logLevel is greater then to passed logLevel") {
                let logger = sharedExampleContext()["logger"] as? Logger
                expect(logger?.shouldLog(for: .debug)).to(beFalse())
                expect(logger?.shouldLog(for: .info)).to(beFalse())
                expect(logger?.shouldLog(for: .warning)).to(beFalse())
            }
        }
        sharedExamples("format must equal default") { (sharedExampleContext: @escaping SharedExampleContext) in
            it("value of logger protocol implementaion") {
                let format = sharedExampleContext()["format"] as? MessageFormat
                expect(format?.description).to(equal(MessageFormat.default.description))
            }
        }
    }
}

class LoggerTests: QuickSpec {
    override func spec() {
        let logger = TestLogger(logLevel: .debug)
        itBehavesLike("format must equal default") { ["format": logger.format] }
        itBehavesLike("should log") { ["logger": logger] }
        
        let errorLogger = TestLogger(logLevel: .error)
        itBehavesLike("format must equal default") { ["format": errorLogger.format] }
        itBehavesLike("should not log") { ["logger": errorLogger] }
    }
}

struct TestLogger: Logger {
    var logLevel: LogLevel
    
    func log(message: String, with logLevel: LogLevel) {
        
    }
}
