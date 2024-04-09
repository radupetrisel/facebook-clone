//
//  UserService.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 06.04.2024.
//

import Foundation
import Firebase

@Observable
final class UserService {
    static let shared = UserService()
    
    var currentUser: User?
    var friends: [User] = []
    var friendRequests: [User] = []
    
    init() {
        Task { try await fetchCurrentUser() }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection(Firestore.USERS).document(uid).getDocument()
        currentUser = try snapshot.data(as: User.self)
        try await fetchFriends()
        try await fetchFriendRequests()
    }
    
    func reset() {
        currentUser = nil
        friends = []
        friendRequests = []
    }
    
    func updateImage(withImageURL imageURL: URL, imagePath: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        try await Firestore.firestore().collection(Firestore.USERS).document(uid).updateData([imagePath : imageURL])
    }
    
    func fetchFriends() async throws {
        let snapshot = try await Firestore.firestore().collection(Firestore.USERS).getDocuments()
        
        guard let currentUser else { return }
        
        friends = snapshot.documents
            .compactMap { try? $0.data(as: User.self) }
            .filter { currentUser.isFriends(with: $0) }
    }
    
    func fetchFriendRequests() async throws {
        let snapshot = try await Firestore.firestore().collection(Firestore.USERS).getDocuments()
        
        guard let currentUser else { return }
        
        friendRequests = snapshot.documents
            .compactMap { try? $0.data(as: User.self) }
            .filter { currentUser.hasFriendRequest(from: $0) }
    }
}
