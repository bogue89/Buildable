public func build<T>(_ builder: @autoclosure() -> T) -> T {
    builder()
}

public func build<T>(_ builder: @autoclosure() -> T, setup: (T) -> (T)) -> T {
    setup(builder())
}

public func build<T>(_ builder: @autoclosure() -> T, setup: (T) -> (T?)) -> T? {
    setup(builder())
}

public func build<T>(_ builder: @autoclosure() -> T, setup: (T) throws -> (T)) throws -> T {
    try setup(builder())
}

public func build<T>(_ builder: @autoclosure() -> T, setup: (T) throws -> (T?)) throws -> T? {
    try setup(builder())
}

public func build<T>(builder: @autoclosure() throws -> T) throws -> T {
    try builder()
}

public func build<T>(builder: @autoclosure() throws -> T, setup: (T) -> (T)) throws -> T {
    try setup(builder())
}

public func build<T>(builder: @autoclosure() throws -> T, setup: (T) -> (T?)) throws -> T? {
    try setup(builder())
}

public func build<T>(builder: @autoclosure() throws -> T, setup: (T) throws -> (T)) throws -> T {
    try setup(builder())
}

public func build<T>(builder: @autoclosure() throws -> T, setup: (T) throws -> (T?)) throws -> T? {
    try setup(builder())
}
