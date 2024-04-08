//
//  User.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 26.03.2024.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    
    var firstName: String
    var familyName: String
    
    var email: String
    
    var profileImageName: String?
    var coverImageName: String?
    
    var age: Int
    let gender: String
    
    var friendsIds: [String]
    var friendRequestsIds: [String]
    
    var isCurrentUser: Bool
    
    var fullName: String {
        "\(firstName) \(familyName)"
    }
    
    func isFriends(with other: User) -> Bool {
        friendsIds.contains(other.id)
    }
    
    func hasFriendRequest(from other: User) -> Bool {
        friendRequestsIds.contains(other.id)
    }
}
