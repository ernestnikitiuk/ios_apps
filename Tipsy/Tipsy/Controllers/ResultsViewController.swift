//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Erik on 15.05.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var moneyToShow = "0.00"
    var numberOfPeople = 2
    var tipsAmount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = moneyToShow
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipsAmount)% tips."
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
