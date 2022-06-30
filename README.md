# Buildable

Buildable comes with a protocol and functions for you to implement Builder Design Patters.

```swift
// DEMO 1: static method from the Buildable NSObject
let icon: UIImageView = .create {
    $0.image = UIImage(systemName: "checkmark.seal.fill")
    $0.tintColor = .systemBlue
    $0.contentMode = .scaleAspectFit
    $0.isUserInteractionEnabled = true
}
```

## Xcode

In `Package Dependencies` inside your project file paste the repo url `https://github.com/bogue89/Buildable` in the field "Search or Enter Package URL".

Set the Dependency Rule to Up to Next Major Version using the latest `Buildable` [release](https://github.com/bogue89/Buildable/releases)

Resolve Package Versions

## Uses

#### Import package

```swift
import Build
import Buildable
import BuildableObjects
```

#### Demos

`Build` simplifies declarations, works well with property wrappers, and it works with @autoclosures so the work is done only when need it

```swift
// DEMO 2: infering type from builder
let tap = build {
    UITapGestureRecognizer(target: ViewController.self, action: #selector(tapped))
}
```

Conforming to `Buildable` implements by default a setup method 

```swift
// DEMO 3: setup with reference
var animation = CABasicAnimation(keyPath: "opacity").setup {
    $0.toValue = 0.2
    $0.duration = 0.2
    $0.autoreverses = true
}
```

You can use the setup to swap values and throw errors

```swift
// DEMO 4: setup with reference
try buildWithError(.touches(times: taps)) {
    guard case .touches(let times) = $0 else { return $0 }
    if times > 3 {
        throw NSError()
    } else if times > 2 {
        return .warning
    }
    return $0
}
```

## Swift Package Manager

#### Add dependencies

Add the `Buildable` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `Buildable` [release](https://github.com/bogue89/Buildable/releases).

```swift
.package(url: "https://github.com/bogue89/Buildable.git", from: "x.x.x")
```

Add `Buildable` to your target's dependencies:

```swift
.target(name: "example", dependencies: ["Buildable"]),
```

### Swift version

The latest version of Buildable requires **Swift 4.0** or later. You can download this version of the Swift binaries by following this [link](https://swift.org/download/).
