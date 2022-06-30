# Buildable

Buildable comes with a protocol and functions for you to implement Builder Design Patters.

```swift
let icon: UIImageView = .setup {
    $0.image = UIImage(systemName: "checkmark.seal.fill")
    $0.tintColor = .systemBlue
    $0.contentMode = .scaleAspectFit
}
```

## Xcode

In `Package Dependencies` inside your project file paste the repo url `https://github.com/bogue89/Buildable` in the field "Search or Enter Package URL".

Set the Dependency Rule to Up to Next Major Version using the latest `Buildable` [release](https://github.com/bogue89/Buildable/releases)

Resolve Package Versions

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

## Uses

#### Import package

```swift
import Buildable
```

#### Uses

It simplifies declarations, works well with property wrappers, and the it works with @autoclosures

```swift
class ViewController: UIViewController {

    lazy
    var icon: UIImageView = .setup {
        $0.image = UIImage(systemName: "checkmark.seal.fill")
        $0.tintColor = .systemBlue
        $0.contentMode = .scaleAspectFit
        $0.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(icon)
    }

}
```


### Swift version

The latest version of Buildable requires **Swift 4.0** or later. You can download this version of the Swift binaries by following this [link](https://swift.org/download/).
