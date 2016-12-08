//
//  MessageFormatTests.swift
//  Logomotive
//
//  Created by Andreas on 08.12.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Logomotive
import Quick
import Nimble

class MessageFormatTests: QuickSpec {
    override func spec() {
        it("default format") {
            let expectedFormat = MessageFormat().dateTime.space.string("[").executable.string("]").space.file.string(".").function.string(":").line.space.logLevel.string(":").space
            expect(MessageFormat.default).to(equal(expectedFormat))
        }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().dateTime, "expected": "#DATE#"] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().executable, "expected": "#EXEC#"] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().file, "expected": "#FILE#"] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().function, "expected": "#FUNC#"] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().line, "expected": "#LINE#"] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().logLevel, "expected": "#LEVEL#"] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().space, "expected": " "] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().string("Hello World!"), "expected": "Hello World!"] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat().string(""), "expected": ""] }
        itBehavesLike("format description") { ["messageFormat": MessageFormat.default, "expected": "#DATE# [#EXEC#] #FILE#.#FUNC#:#LINE# #LEVEL#: "] }
    }
}

class MessageFormatTestConfiguration: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples("format description") { (sharedExampleContext: @escaping SharedExampleContext) in
            let params = sharedExampleContext()
            let expectedDescription = params["expected"] as? String
            it("is equal to \(expectedDescription)") {
                let format = params["messageFormat"] as? MessageFormat
                expect(format?.description).to(equal(expectedDescription))
            }
        }
    }
}
