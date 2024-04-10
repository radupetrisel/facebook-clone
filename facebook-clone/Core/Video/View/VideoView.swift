//
//  VideoView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 25.03.2024.
//

import SwiftUI

struct VideoView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VideoOptionView()
                
                ForEach(0 ..< 3) { _ in
                    PostView(post: .preview)
                }
            }
            .scrollIndicators(.hidden)
            .toolbar { toolbar }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Video")
                .font(.title)
                .bold()
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 16) {
                Image(systemName: "person")
                    .symbolVariant(.fill)
                
                Image(systemName: "magnifyingglass")
            }
            .bold()
        }
    }
}

#Preview {
    VideoView()
}
