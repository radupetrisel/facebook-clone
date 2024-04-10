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
    
    func uploadPost(_ title: String, mediaData: Data?, isVideo: Bool) async throws {
        try await PostService.shared.uploadPost(title, mediaData: mediaData, isVideo: isVideo)
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
    
    func saveDataToTemporaryDir(data: Data) -> URL {
        do {
            let fileURL = URL.temporaryDirectory.appending(path: "video.mp4")
            try data.write(to: fileURL)
            
            return fileURL
        } catch {
            fatalError("Error saving data to temporary directory: \(error.localizedDescription)")
        }
    }
    
    func cleanUpTemporaryDir(url: URL) {
        do {
                try FileManager.default.removeItem(at: url)
        } catch {
            fatalError("Error cleaning temporary directory: \(error.localizedDescription)")
        }
    }
}
