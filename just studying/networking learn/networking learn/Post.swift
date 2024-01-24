//
//  Post.swift
//  networking learn
//
//  Created by Erik on 24.01.2024.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
