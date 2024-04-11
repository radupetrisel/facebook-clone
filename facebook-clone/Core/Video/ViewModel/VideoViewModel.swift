//
//  VideoViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 11.04.2024.
//

import Foundation

@Observable
final class VideoViewModel {
    var videoPosts: [Post] = []
    
    init() {
        fetchVideoPosts()
    }
    
    func fetchVideoPosts() {
        Task {
            do {
                videoPosts = try await PostService.shared.fetchVideoPosts()
            } catch {
                print("Could not fetch videos: \(error.localizedDescription)")
            }
        }
    }
}
