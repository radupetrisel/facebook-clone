//
//  AuthService.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 02.04.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@Observable
final class AuthService {
    static let shared = AuthService()
    var session: FirebaseAuth.User?
    
    init() {
        session = Auth.auth().currentUser
    }
    
    func addUser(firstName: String, familyName: String, email: String, age: Int, gender: String, password: String) async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            session = result.user
            
            let user = User(id: result.user.uid, firstName: firstName, familyName: familyName, email: email, age: age, gender: gender, friendsIds: [], friendRequestsIds: [], isCurrentUser: true)
            try await uploadUser(user: user)
        } catch {
            print("Error adding user to Firebase: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            session = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("Failed to login: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func logout() {
        try? Auth.auth().signOut()
        session = nil
        UserService.shared.reset()
    }
    
    private func uploadUser(user: User) async throws {
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection(Firestore.USERS).document(user.id).setData(userData)
    }
}
