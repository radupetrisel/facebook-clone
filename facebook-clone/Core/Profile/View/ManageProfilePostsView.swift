//
//  ManageProfilePostsView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 18.03.2024.
//

import SwiftUI

struct ManageProfilePostsView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Posts")
                    .semiboldHeadline()
                
                Spacer()
                
                Text("Filters")
                    .semiboldHeadline()
                    .foregroundStyle(.blue)
            }
            .padding(.horizontal)
            
            HStack(spacing: 16) {
                Image("profilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                
                Text("What's on your mind?")
                
                Spacer()
                
                Image(systemName: "photo.on.rectangle.angled")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
            .padding(.horizontal)
            
            Color.systemGray6
                .frame(height: 70)
                .overlay {
                    HStack {
                        ProfilePostButton(title: "Reel", systemImage: "play.rectangle.fill")
                        
                        ProfilePostButton(title: "Live", systemImage: "video.fill")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            
            Button(action: {}) {
                HStack(spacing: 10) {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .scaledToFill()
                        .symbolVariant(.fill)
                        .frame(width: 16, height: 16)
                    
                    Text("Manage posts")
                        .semiboldHeadline()
                }
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(.systemGray5)
                .foregroundStyle(.darkGray)
                .clipShape(.rect(cornerRadius: 8))
                .padding()
            }
            .buttonStyle(.plain)
            
            DividerView()
        }
    }
}

#Preview {
    GeometryReader { proxy in
        ManageProfilePostsView()
    }
}
