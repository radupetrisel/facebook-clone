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
    private(set) var posts: [Post] = []
    private(set) var currentUserPosts: [Post] = []
    
    var currentUser: User { UserService.shared.currentUser ?? .preview }
    var friends: [User] { UserService.shared.friends }
    
    init() {
        setupPosts()
        setupCurrentUserPostsIndices()
    }
    
    func updateImage(_ imageData: Data, imagePath: String) async throws -> URL {
        let imageURL = try await ImageUploader.uploadImage(withData: imageData)
        try await UserService.shared.updateImage(withImageURL: imageURL, imagePath: imagePath)
        
        return imageURL
    }
    
    func uploadPost(_ title: String, imageData: Data?) async throws {
        try await PostService.uploadPost(title, imageData: imageData)
    }
    
    private func setupPosts() {
//        for index in posts.indices {
//            posts[index].user = users.first(where: { $0.id == posts[index].id })
//        }
    }
    
    private func setupCurrentUserPostsIndices() {
        currentUserPosts = posts.filter { $0.userId == currentUser.id }
    }
}
