//
//  VideoUploader.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 10.04.2024.
//

import Foundation
import FirebaseStorage

struct VideoUploader {
    static func uploadVideo(_ data: Data) async throws -> URL {
        let fileName = UUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/videos/\(fileName)")
        
        let metadata = StorageMetadata()
        metadata.contentType = "video/quicktime"
        
        let _ = try await storageRef.putDataAsync(data, metadata: metadata)
        return try await storageRef.downloadURL()
    }
}
