//
//  ViewController.swift
//  BuildableDemo
//
//  Created by Jorge Benavides
//

import UIKit

class ViewController: UIViewController {

    let icon: UIImageView = .create {
        $0.image = UIImage(systemName: "checkmark.seal.fill")
        $0.tintColor = .systemBlue
        $0.contentMode = .scaleAspectFit
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(icon)
        icon.frame = view.bounds
    }

}

