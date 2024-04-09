//
//  PostService.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 08.04.2024.
//

import Foundation
import Firebase

struct PostService {
    static func uploadPost(_ title: String, imageData: Data?) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let imageData else { return }
        guard let imageURL = await ImageUploader.uploadImage(withData: imageData) else { return }
        
        let postRef = Firestore.firestore().collection(Firestore.POSTS).document()
        
        let post = Post(id: postRef.documentID, userId: uid, title: title, likes: 0, shares: 0, url: imageURL, isVideo: false, timeStamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        try await postRef.setData(encodedPost)
    }
}
