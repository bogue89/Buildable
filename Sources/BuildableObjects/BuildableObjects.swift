import Foundation
import Buildable

extension NSObject: Buildable {
    public static func create<T: NSObject>(_ setup: (inout T) -> ()) -> T {
        T().setup(setup)
    }
}
