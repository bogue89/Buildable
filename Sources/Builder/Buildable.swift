import Foundation

public protocol Buildable { }

extension Buildable {
    func setup(_ build: (inout Self) -> ()) -> Self {
        var mutating = self
        build(&mutating)
        return mutating
    }
}

extension NSObject: Buildable {
    static func setup<T: NSObject>(_ build: (inout T) -> ()) -> T {
        T().setup(build)
    }
}


public func build<T>(_ builder: () -> T) -> T {
    builder()
}

public func build<T>(_ builder: @autoclosure() -> T) -> T {
    builder()
}

public func build<T>(_ builder: @autoclosure() -> T, setup: (T) -> (T)) -> T {
    setup(builder())
}

public func buildWithError<T>(_ builder: () throws -> T) throws -> T {
    try builder()
}

public func buildWithError<T>(_ builder: @autoclosure() throws -> T) throws -> T {
    try builder()
}

public func buildWithError<T>(_ builder: @autoclosure() throws -> T, setup: (T) throws -> (T)) throws -> T {
    try setup(builder())
}
