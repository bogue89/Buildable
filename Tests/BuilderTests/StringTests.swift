import XCTest
@testable import Build

final class StringTests: XCTestCase {

    var value: String { "Hello, World!" }

    func testRegularInitialization() {
        let sut = String(value)

        XCTAssertEqual(sut, value)
    }
    
    func testBuilderInitialization() {
        let sut = build(String(value))

        XCTAssertEqual(sut, value)
    }

    func testBuilderClosure() {
        let sut = build {
            String(value)
        }

        XCTAssertEqual(sut, value)
    }

    func testBuilderSetup() {
        let sut = build(String()) {
            let string = $0+value
            return string
        }

        XCTAssertEqual(sut, value)
    }

    func testBuilderOptionalSetup() {
        let sut = build(String()) { _ in
            return nil
        }

        XCTAssertNil(sut)
    }

    func testBuilderInferingType() {
        let sut = build(.init()) { $0+value }

        XCTAssertEqual(sut, value)
    }

    func testBuilderOptionalBuilder() {
        let sut = build(String(value)) { _ in nil }

        XCTAssertNil(sut)
    }

    var error: Error {
        NSError(domain: Bundle.main.bundleIdentifier ?? "", code: 0)
    }

    func throwableBuilderWithThrow() throws -> String {
        try buildWithError(String(value)) { _ in throw error }
    }

    func throwableBuilderWithoutThrow() -> String {
        (try? buildWithError(String(value)) { _ in throw error }) ?? value
    }

    func throwableBuilderOptionalWithThrow() throws -> String? {
        try buildWithError(String(value)) { _ in throw error }
    }

    func throwableBuilderOptionalWithoutThrow() -> String? {
        try? buildWithError(String(value)) { _ in throw error }
    }

    func testBuilderThrowableBuilder() {
        XCTAssertThrowsError(try throwableBuilderWithThrow())
        XCTAssertEqual(throwableBuilderWithoutThrow(), value)
        XCTAssertThrowsError(try throwableBuilderOptionalWithThrow())
        XCTAssertNil(throwableBuilderOptionalWithoutThrow())
    }

}
