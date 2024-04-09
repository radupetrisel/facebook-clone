//
//  ImageUploader.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 07.04.2024.
//

import Firebase
import FirebaseStorage
import Foundation

struct ImageUploader {
    static func uploadImage(withData imageData: Data) async throws -> URL {
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/images/\(fileName)")
        
        let _ = try await storageRef.putDataAsync(imageData)
        return try await storageRef.downloadURL()
    }
}
