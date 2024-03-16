//
//  PostView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 16.03.2024.
//

import SwiftUI

struct PostView: View {
    let width: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("profilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Omar Thamri")
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
            
            Text("Time to party")
                .padding(.horizontal)
            
            Image("office")
                .resizable()
                .scaledToFill()
            
            HStack(spacing: 3) {
                Image("like")
                    .resizable()
                    .frame(width: 18, height: 18)
                
                Text("5")
                
                Spacer()
                
                Text("3 comments")
                Circle()
                    .frame(width: 2, height: 2)
                    .padding(.horizontal, 3)
                Text("2 shares")
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
            
            DividerView(width: width - 15)
        }
    }
}

#Preview {
    GeometryReader { proxy in
        PostView(width: proxy.size.width)
    }
}
