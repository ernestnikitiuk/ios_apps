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
        
//        networkManager.getAllPosts { posts in
//            DispatchQueue.main.async {
//                self.posts = posts
//            }
//        }
        
        networkManager.getPostsBy(userId: 3)  { posts in
            DispatchQueue.main.async {
                self.posts = posts
            }
        }
    }
    
    
    @IBAction func createPost(_ sender: Any) {
        
        var post = Post(userId: 2, id: 1, title: "Time to write", body: "Wwerwerwerd fsdfsfdsf sdfsdfrewr sdsfdg s")
        
        networkManager.postCreatePost(post) { serverPost in
            post.id = serverPost.id
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Great", message: "Your Post has been created", preferredStyle: .alert)
                self.present(alert, animated: true)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    alert.dismiss(animated: true)
                }
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
