import XCTest
@testable import Builder

class DataTests: XCTestCase {

    var url: URL { URL(fileURLWithPath: "") }

    func testRegularInitialization() {
        let sut = try? Data(contentsOf: url)
        XCTAssertNil(sut)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
