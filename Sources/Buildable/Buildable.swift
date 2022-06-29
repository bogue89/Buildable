public protocol Buildable { }

public extension Buildable {
    func setup(_ builder: (inout Self) -> ()) -> Self {
        var mutating = self
        builder(&mutating)
        return mutating
    }
}
