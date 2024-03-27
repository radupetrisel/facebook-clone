//
//  FeedViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 27.03.2024.
//

import Foundation

@Observable
final class FeedViewModel {
    private(set) var users: [User] = [
        .init(id: "0", firstName: "Omar", familyName: "Thamri", email: "omar.thamri@gmail.com", profileImageName: "profilePic", coverImageName: "cover_picture", age: 28, gender: "male", friendsIds: ["3", "5", "6", "7"], friendRequestsIds: ["1", "2", "4"], isCurrentUser: true),
        .init(id: "1", firstName: "Dwight", familyName: "Schrute", email: "dwight.shrute@gmail.com", profileImageName: "dwight", age: 50, gender: "male", friendsIds: [], friendRequestsIds: [], isCurrentUser: false),
        .init(id: "2", firstName: "Pam", familyName: "Beesley", email: "pam.beesley@gmail.com", profileImageName: "pam", age: 42, gender: "female", friendsIds: [], friendRequestsIds: [], isCurrentUser: false),
        .init(id: "3", firstName: "Jim", familyName: "Halpert", email: "jim.halpert@gmail.com", profileImageName: "profilePic1", coverImageName: "Story1", age: 40, gender: "male", friendsIds: ["0"], friendRequestsIds: [], isCurrentUser: false),
        .init(id: "4", firstName: "Natasha", familyName: "Romanoff", email: "natasha.romanoff@gmail.com", profileImageName: "romanoff", age: 38, gender: "female", friendsIds: [], friendRequestsIds: [], isCurrentUser: false),
        .init(id: "5", firstName: "Elizabeth", familyName: "Olsen", email: "elizabeth.olsen@gmail.com", profileImageName: "profilePic2", coverImageName: "Story2", age: 32, gender: "female", friendsIds: ["0"], friendRequestsIds: [], isCurrentUser: false),
        .init(id: "6", firstName: "Thomas", familyName: "Shelby", email: "thomas.shelby@gmail.com", profileImageName: "profilePic3", coverImageName: "Story3", age: 43, gender: "male", friendsIds: ["0"], friendRequestsIds: [], isCurrentUser: false),
        .init(id: "7", firstName: "Nancy", familyName: "Wheeler", email: "nancy.wheeler@gmail.com", profileImageName: "profilePic4", coverImageName: "Story4", age: 27, gender: "female", friendsIds: ["0"], friendRequestsIds: [], isCurrentUser: false),
    ]
    
    private(set) var friends: [User] = []
    
    private(set) var posts: [Post] = [
        .init(id: "0", userId: "3", title: "Best team ever", likes: 2, shares: 2, url: "office", isVideo: false),
        .init(id: "1", userId: "0", title: "You'll never walk alone", likes: 3, shares: 4, url: "stadium", isVideo: false),
    ]
    
    var currentUser: User {
        users.first(where: { $0.isCurrentUser }) ?? users[0]
    }
    
    init() {
        setupFriends()
        setupPosts()
    }
    
    private func setupFriends() {
        if let currentUser = users.first(where: { $0.isCurrentUser }) {
            friends = users.filter { currentUser.friendsIds.contains($0.id) }
        }
    }
    
    private func setupPosts() {
        for index in posts.indices {
            posts[index].user = users.first(where: { $0.id == posts[index].id })
        }
    }
}
