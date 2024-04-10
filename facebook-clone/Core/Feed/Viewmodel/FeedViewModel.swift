//
//  FeedViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 27.03.2024.
//

import Foundation
import Firebase

@Observable
final class FeedViewModel {
    var currentUser: User { UserService.shared.currentUser ?? .preview }
    var friends: [User] { UserService.shared.friends }

    var posts: [Post] = []
    var currentUserPosts: [Post] = []
    
    init() {
        fetchPosts()
        fetchCurrentUserPosts()
    }
    
    func updateImage(_ imageData: Data, imagePath: String) async throws -> URL {
        let imageURL = try await ImageUploader.uploadImage(withData: imageData)
        try await UserService.shared.updateImage(withImageURL: imageURL, imagePath: imagePath)
        
        return imageURL
    }
    
    func uploadPost(_ title: String, imageData: Data?) async throws {
        try await PostService.shared.uploadPost(title, imageData: imageData)
    }
    
    func fetchPosts() {
        Task {
            do {
                posts = try await PostService.shared.fetchPosts()
            } catch {
                print("Could not fetch posts: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchCurrentUserPosts() {
        Task {
            do {
                currentUserPosts = try await PostService.shared.fetchCurrentUserPosts()
            } catch {
                print("Could not fetch current user posts: \(error.localizedDescription)")
            }
        }
    }
}
