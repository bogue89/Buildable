import XCTest
@testable import Builder

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

    func testBuilderSetup() {
        let sut = build(String()) { $0+value }

        XCTAssertEqual(sut, value)
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
        try build(String(value)) { _ in throw error }
    }

    func throwableBuilderWithoutThrow() -> String {
        (try? build(String(value)) { _ in throw error }) ?? value
    }

    func throwableBuilderOptionalWithThrow() throws -> String? {
        try build(String(value)) { _ in throw error }
    }

    func throwableBuilderOptionalWithoutThrow() -> String? {
        try? build(String(value)) { _ in throw error }
    }

    func testBuilderThrowableBuilder() {
        XCTAssertThrowsError(try throwableBuilderWithThrow())
        XCTAssertEqual(throwableBuilderWithoutThrow(), value)
        XCTAssertThrowsError(try throwableBuilderOptionalWithThrow())
        XCTAssertNil(throwableBuilderOptionalWithoutThrow())
    }

}
