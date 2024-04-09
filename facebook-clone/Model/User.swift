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
    
    var profileImageURL: URL?
    var coverImageURL: URL?
    
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

extension User {
    static let preview: User = User(id: "", firstName: "Test", familyName: "User", email: "test.user@test.com", age: 20, gender: GenderChoice.male.rawValue, friendsIds: [], friendRequestsIds: [], isCurrentUser: true)
}
