import XCTest
@testable import SwiftPygments
import PythonKit
final class SwiftPygmentsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        let sys = Python.import("sys")
        
        
        print("Python \(sys.version_info.major).\(sys.version_info.minor)")
        print("Python Version: \(sys.version)")
        print("Python Encoding: \(sys.getdefaultencoding().upper())")
        
        let code = "var i = 1\nprint(\"Hello World\")"
        
        if let lexer = Pygments.Lexer.named("swift") {
            print("Lexer Name:  ", lexer.name)
            print("Lexer Alias: ", lexer.alias)
            
            XCTAssertEqual(Pygments.html(code, use: lexer), Pygments.html(code, use: .swift))
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
