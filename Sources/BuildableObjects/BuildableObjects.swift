import Foundation
import Buildable

extension NSObject: Buildable {
    public static func setup<T: NSObject>(_ builder: (inout T) -> ()) -> T {
        T().setup(builder)
    }
}
