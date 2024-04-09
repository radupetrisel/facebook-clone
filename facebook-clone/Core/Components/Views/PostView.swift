//
//  PostView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 16.03.2024.
//

import AVKit
import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(post.user?.profileImageURL?.absoluteString ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(post.user?.fullName ?? "")
                        .font(.system(size: 14, weight: .semibold))
                    
                    HStack(spacing: 5) {
                        Text("1d")
                        
                        Circle()
                            .frame(width: 2, height: 2)
                            .bold()
                        
                        Image(systemName: "globe")
                            .font(.system(size: 12))
                            .foregroundStyle(.facebookBlue)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 24) {
                    Image(systemName: "ellipsis")
                    Image(systemName: "xmark")
                }
                .foregroundStyle(.gray)
                .bold()
            }
            .padding(.horizontal)
            
            Text(post.title)
                .padding(.horizontal)
            
            if post.isVideo {
                VideoPlayer(player: AVPlayer(url: post.imageURL))
                        .frame(height: 400)
            } else {
                Image(post.imageURL.absoluteString)
                    .resizable()
                    .scaledToFill()
            }
            
            HStack(spacing: 3) {
                Image("like")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text(String(post.likes))
                
                Spacer()
                
                Text("3 comments")
                Circle()
                    .frame(width: 2, height: 2)
                    .padding(.horizontal, 3)
                Text("\(post.shares) shares")
            }
            .font(.system(size: 12))
            .foregroundStyle(.facebookBlue)
            .padding(.horizontal)
            
            Divider()
                .background(.white.opacity(0.5))
            
            HStack {
                Spacer()
                
                HStack {
                    Image(systemName: "hand.thumbsup")
                    Text("Like")
                }
                Spacer()
                
                HStack {
                    Image(systemName: "message")
                    Text("Comment")
                }
                Spacer()
                
                HStack {
                    Image("icone-messager-noir")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Send")
                }
                Spacer()
                
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                    Text("Share")
                }
                Spacer()
            }
            .font(.system(size: 12))
            .foregroundStyle(.facebookBlue)
            
            DividerView()
        }
    }
}

#Preview {
    PostView(post: FeedViewModel().posts[0])
}
