//
//  ViewController.swift
//  Vles4
//
//  Created by Erik on 05.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Photo Access", message: "Do you allow to use your photos?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet() {
        
        enum Films: String {
            case film1 = "Spider Man"
            case film2 = "Young Sheldon"
            case film3 = "Harry Potter"
        }
        
        let alert = UIAlertController(title: nil, message: "Choose Film", preferredStyle: .actionSheet)
        
        let handler: (_ type: Films) -> (UIAlertAction) -> Void = { type in
            return { action in
                print(type.rawValue)
            }
        }
 
        let film1 = UIAlertAction(title: Films.film1.rawValue, style: .default, handler: handler(.film1))
        alert.addAction(film1)
        
        let film2 = UIAlertAction(title: Films.film2.rawValue, style: .default, handler: handler(.film2))
        alert.addAction(film2)
        
        let film3 = UIAlertAction(title: Films.film3.rawValue, style: .default, handler: handler(.film3))
        alert.addAction(film3)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
}

