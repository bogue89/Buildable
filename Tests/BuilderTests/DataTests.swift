import XCTest
@testable import Builder

class DataTests: XCTestCase {

    var value: Data { "Hello, World!".data(using: .utf8)! }

    func testRegularInitialization() {
        let sut = Data(referencing: value as NSData)

        XCTAssertEqual(sut, value)
    }
    
    func testBuilderInitialization() {
        let sut = build(Data(referencing: value as NSData))

        XCTAssertEqual(sut, value)
    }

    func testBuilderClosure() {
        let sut = build {
            Data(referencing: value as NSData)
        }

        XCTAssertEqual(sut, value)
    }

    func testBuilderSetup() {
        let sut = build(Data()) {_ in
            var data = Data()
            data.append(value)
            return data
        }

        XCTAssertEqual(sut, value)
    }

    func testBuilderOptionalSetup() {
        let sut = build(Data()) { _ in
            return nil
        }

        XCTAssertNil(sut)
    }

    func testBuilderInferingType() {
        let sut = build(.init()) { (_) -> Data in
            var data = Data()
            data.append(value)
            return data
        }

        XCTAssertEqual(sut, value)
    }

    func testBuilderOptionalBuilder() {
        let sut = build(Data()) { _ in nil }

        XCTAssertNil(sut)
    }

    var error: Error {
        NSError(domain: Bundle.main.bundleIdentifier ?? "", code: 0)
    }

    var url: URL {
        URL(fileURLWithPath: "")
    }

    func throwableBuilderWithThrow() throws -> Data {
        try buildWithError(Data(contentsOf: url)) { _ in throw error }
    }

    func throwableBuilderWithoutThrow() -> Data {
        (try? buildWithError(Data(contentsOf: url)) { _ in throw error }) ?? value
    }

    func throwableBuilderOptionalWithThrow() throws -> Data? {
        try buildWithError(Data(contentsOf: url)) { _ in throw error }
    }

    func throwableBuilderOptionalWithoutThrow() -> Data? {
        try? buildWithError(Data(contentsOf: url)) { _ in throw error }
    }

    func testBuilderThrowableBuilder() {
        XCTAssertThrowsError(try throwableBuilderWithThrow())
        XCTAssertEqual(throwableBuilderWithoutThrow(), value)
        XCTAssertThrowsError(try throwableBuilderOptionalWithThrow())
        XCTAssertNil(throwableBuilderOptionalWithoutThrow())
    }

}
