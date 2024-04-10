//
//  Post.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 26.03.2024.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let userId: String
    
    var title: String
    var likes: Int
    var shares: Int
    var imageURL: URL?
    
    var isVideo: Bool
    
    let timeStamp: Timestamp
    
    var user: User?
    
    func belongs(to user: User) -> Bool {
        userId == user.id
    }
}

extension Post {
    static let preview = Post(id: "", userId: "", title: "Post", likes: 3, shares: 1, imageURL: URL(string: ""), isVideo: false, timeStamp: Timestamp())
}
