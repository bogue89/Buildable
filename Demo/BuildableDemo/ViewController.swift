//
//  ViewController.swift
//  BuildableDemo
//
//  Created by Jorge Benavides
//

import UIKit

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

