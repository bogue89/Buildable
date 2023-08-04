//
//  DemoViewController.swift
//  BuildableDemo
//
//  Created by Jorge Benavides
//

import UIKit
import Build
import Buildable

class DemoViewController: UIViewController {

    // DEMO 1: static method from the Buildable NSObject
    let icon: UIImageView = .create {
        $0.image = UIImage(systemName: "checkmark.seal.fill")
        $0.tintColor = .systemBlue
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(icon)
        icon.frame = view.bounds
    }

    // DEMO 2: infering type from builder
    lazy var tap = build {
        UITapGestureRecognizer(target: self, action: #selector(tapped))
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        icon.addGestureRecognizer(tap)
    }

    @objc func tapped() {
        animateIcon()

        print(String(describing: touchEvent))
    }

    // DEMO 3: setup with reference
    var animation = CABasicAnimation(keyPath: "opacity").setup {
        $0.toValue = 0.2
        $0.duration = 0.2
        $0.autoreverses = true
    }

    var taps: Int = 0

    var touchEvent: UserEvent? {
        taps += 1

        do {
            // DEMO 4: setup with reference
            return try buildWithError(.touches(times: taps)) {
                guard case .touches(let times) = $0 else { return $0 }
                if times > 3 {
                    throw NSError(domain: "", code: 0)
                } else if times > 2 {
                    return .warning
                }
                return $0
            }
        } catch {
            return .error
        }
    }

    func animateIcon() {
        self.icon.layer.add(animation, forKey: nil)
    }
}

enum UserEvent {
    case touches(times: Int)
    case warning
    case error
}
