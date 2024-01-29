//
//  NetworkManager.swift
//  Test
//
//  Created by Erik on 27.01.2024.
//

import Foundation

class NetworkManager {
    
    enum HTTPMethod: String {
        case POST
        case PUT
        case GET
        case DELETE
    }
    
    enum APIs: String {
        case posts
        case users
        case comments
    }
    
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func getAllPosts(_ completionHandler: @escaping ([Post]) -> Void){
        if let url = URL(string: baseURL + APIs.posts.rawValue) {
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
    
    func postCreatePost (_ post: Post, completionHandler: @escaping (Post) -> Void) {
        guard let url = URL(string: baseURL + APIs.posts.rawValue),
              let data = try? JSONEncoder().encode(post) else {
            return
        }
        
        //let request = MutableURLRequest(url: url)
        //request.httpMethod = HTTPMethod.POST.rawValue
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.POST.rawValue
        request.httpBody = data
        request.setValue("\(data.count)", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error")
            } else if let resp = response as? HTTPURLResponse,
                    resp.statusCode == 201, let responseData = data {
//                let json = try? JSONSerialization.jsonObject(with: responseData)
//                print(json)
                
                if let responsePost = try? JSONDecoder().decode(Post.self, from: responseData){
                    completionHandler(responsePost)
                }
                
                
            }
        }.resume()
        
        
    }
    
    func getPostsBy(userId: Int, completionHandler: ([Post]) -> Void ){
        guard let url = URL(string: baseURL + APIs.posts.rawValue) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "userId", value: "\(userId)")]
        
        guard let queryURL = components?.url else { return }
        
        URLSession.shared.dataTask(with: queryURL) {data, response, error in
            if error != nil {
                print("error getPostBy")
            } else if let resp = response as? HTTPURLResponse,
                resp.statusCode == 200, let responseData = data {
               
                let posts = try? JSONDecoder().decode([Post].self, from: responseData)
                
                completionHandler(posts ?? [])
            }
        }
        
    }
}
