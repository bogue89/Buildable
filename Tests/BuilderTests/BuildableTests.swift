import XCTest
import Foundation
@testable import BuildableObjects

final class BuildableTests: XCTestCase {

    let data = "Hello, World!".data(using: .utf8)!

    func testBuildableReference() {
        let sut = NSMutableData().setup {
            $0.append(data)
        }

        XCTAssertEqual(sut, data as NSData)
    }

    func testBuildableStatic() {
        let sut: NSMutableData = .setup {
            $0.append(data)
        }

        XCTAssertEqual(sut, data as NSData)
    }
}

#if !os(watchOS)
#if os(macOS)
import AppKit
extension BuildableTests {
    func testBuildableNSView() {
        let placement: NSView.LayerContentsPlacement = .scaleAxesIndependently
        let sut = NSView().setup {
            $0.layerContentsPlacement = placement
        }
        XCTAssertEqual(sut.layerContentsPlacement, placement)
    }

    func testBuildableNSTextField() {
        let text = "hello world!"
        let sut = NSTextField().setup {
            $0.stringValue = text
        }
        XCTAssertEqual(sut.stringValue, text)
    }
}
#else
import UIKit
extension BuildableTests {

    func testBuildableUIView() {
        let color: UIColor = .red
        let sut = UIView().setup {
            $0.backgroundColor = color
        }
        XCTAssertEqual(sut.backgroundColor, color)
    }

    func testBuildableUILabel() {
        let text = "hello world!"
        
        let sut: UILabel = .setup {
            $0.text = text
        }
        XCTAssertEqual(sut.text, text)
    }
}
#endif
#endif
