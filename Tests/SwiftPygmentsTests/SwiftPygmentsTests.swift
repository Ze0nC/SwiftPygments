import XCTest
@testable import SwiftPygments

final class SwiftPygmentsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftPygments().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
