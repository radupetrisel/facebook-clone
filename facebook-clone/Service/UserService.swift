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
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection(Firestore.USERS).document(uid).getDocument()
        currentUser = try snapshot.data(as: User.self)
    }
    
    func reset() {
        currentUser = nil
    }
    
    func updateImage(withImageURL imageURL: String, imagePath: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        try await Firestore.firestore().collection(Firestore.USERS).document(uid).updateData([imagePath : imageURL])
        
        currentUser?.profileImageName = imageURL
    }
}
