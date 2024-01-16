//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = ""
        titleLabel2.text = ""
        var charIndex = 0.0
        var charIndex2 = 0.0
        let titleText = K.appName
        let titleText2 = K.mySign
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
        
        for letter in titleText2 {
            let timeSpace = 0.1*Double(titleText.count)
            Timer.scheduledTimer(withTimeInterval: timeSpace + 0.1 * charIndex2, repeats: false) { timer in
                self.titleLabel2.text?.append(letter)
            }
            charIndex2 += 1
        }
        
       
    }
    
    

    

}
