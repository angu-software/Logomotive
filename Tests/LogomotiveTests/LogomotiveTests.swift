import XCTest
@testable import Logomotive

class LogomotiveTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Logomotive().text, "Hello, World!")
    }


    static var allTests : [(String, (LogomotiveTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
