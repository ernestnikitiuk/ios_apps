//
//  NetworkManager.swift
//  Test
//
//  Created by Erik on 27.01.2024.
//

import Foundation

 class NetworkManager {
    
    let baseURL = "https://jsonplaceholder.typicode.com"
    
    func getAllPosts(_ completionHandler: @escaping ([Post]) -> Void){
        if let url = URL(string: baseURL+"/posts") {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("error")
                } else {
                    if let resp = response as? HTTPURLResponse, resp.statusCode == 200, let responseData = data {
                        let posts = try? JSONDecoder().decode([Post].self, from: responseData)
                        
                        completionHandler(posts ?? [])
                    }
                }
                          
            }.resume()
        }
    }
}
