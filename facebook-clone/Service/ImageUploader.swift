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
    static func uploadImage(withData imageData: Data) async -> String? {
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/images/\(fileName)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("Failed to upload image: \(error.localizedDescription)")
            
            return nil
        }
    }
}
