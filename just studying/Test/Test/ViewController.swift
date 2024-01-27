//
//  ViewController.swift
//  Test
//
//  Created by Erik on 27.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!{
        didSet{
            myTableView.delegate = self
            myTableView.dataSource = self
            
            
            let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
            myTableView.register(nib, forCellReuseIdentifier: "PostCellID")
        }
        
    }
    
    var posts: [Post] = [] {
        didSet{
            myTableView.reloadData()
        }
    }
    
    var networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        networkManager.getAllPosts { posts in
            DispatchQueue.main.async {
                self.posts = posts
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellID", for: indexPath) as! MyTableViewCell
        //cell.configure()
        cell.configure(posts[indexPath.row])
        return cell
        
    }
}
