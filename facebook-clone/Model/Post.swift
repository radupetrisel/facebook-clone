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
    var url: String
    
    var isVideo: Bool
    
    let timeStamp: Timestamp
    
    var user: User?
}
