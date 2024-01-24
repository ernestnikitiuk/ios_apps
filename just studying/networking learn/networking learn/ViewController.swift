//
//  ViewController.swift
//  networking learn
//
//  Created by Erik on 16.01.2024.
//

import UIKit

class ViewController: UIViewController {

    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.getAllPosts { posts in
            print(posts)
        }
    }
    
}

