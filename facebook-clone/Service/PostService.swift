//
//  PostService.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 08.04.2024.
//

import Foundation
import Firebase

@Observable
final class PostService {
    static let shared = PostService()
    
    func uploadPost(_ title: String, mediaData: Data?, isVideo: Bool) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let mediaURL: URL?
        if let mediaData {
            if isVideo {
                mediaURL = try await VideoUploader.uploadVideo(mediaData)
            } else {
                mediaURL = try await ImageUploader.uploadImage(withData: mediaData)
            }
        } else {
            mediaURL = nil
        }
        
        let postRef = Firestore.firestore().collection(Firestore.POSTS).document()
        
        let post = Post(id: postRef.documentID, userId: uid, title: title, likes: 0, shares: 0, imageURL: mediaURL, isVideo: isVideo, timeStamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
    
    func fetchPosts() async throws -> [Post] {
        let data = try await Firestore.firestore().collection(Firestore.POSTS).order(by: "timeStamp", descending: true).getDocuments()
        
        var posts = data.documents
            .compactMap { try? $0.data(as: Post.self) }
        
        for i in posts.indices {
            posts[i].user = try await UserService.shared.fetchUser(withUid: posts[i].userId)
        }
        
        return posts
    }
    
    func fetchCurrentUserPosts() async throws -> [Post] {
        guard let currentUser = UserService.shared.currentUser else { return [] }
        
        let data = try await Firestore.firestore().collection(Firestore.POSTS).order(by: "timeStamp", descending: true).getDocuments()
        
        var posts = data.documents
            .compactMap { try? $0.data(as: Post.self) }
            .filter { $0.belongs(to: currentUser) }
        
        for i in posts.indices {
            posts[i].user = currentUser
        }
        
        return posts
    }
}
