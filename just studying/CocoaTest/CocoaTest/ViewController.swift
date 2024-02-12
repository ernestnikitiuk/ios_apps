//
//  ViewController.swift
//  CocoaTest
//
//  Created by Erik on 02.02.2024.
//

import UIKit
import LTMorphingLabel



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = LTMorphingLabel(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        label.text = "my text was animated"
        view.addSubview(label)
        label.morphingEffect = .evaporate
        label.morphingEnabled = true
        label.morphingDuration = 3
        label.morphingCharacterDelay = 0.3
        label.start()
    }

    @IBAction func moveToVc() {

    }
    
}

