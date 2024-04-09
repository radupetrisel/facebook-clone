//
//  HeaderView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 14.03.2024.
//

import SwiftUI

struct HeaderView: View {
    @State private var showCreatePost = false
    
    let viewModel: FeedViewModel
    
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView()
                    .navigationBarBackButtonHidden()
            } label: {
                AsyncImage(url: viewModel.currentUser.profileImageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(.circle)
                } placeholder: {
                    Image(.noProfile)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(.circle)
                }
            }
            
            Button {
                showCreatePost = true
            } label: {
                HStack {
                    Text("What's on your mind?")
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .overlay {
                    Capsule()
                        .stroke(.quaternary, lineWidth: 1)
                }
                .padding(.leading, 5)
                .padding(.trailing, 15)
            }
            .buttonStyle(.plain)
            
            Image(systemName: "photo.on.rectangle.angled")
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
                .foregroundStyle(.green)
        }
        .padding(.horizontal)
        .padding(.top, 30)
        .padding(.bottom)
        .fullScreenCover(isPresented: $showCreatePost) { CreatePostView(viewModel: viewModel) }
    }
}

#Preview {
    HeaderView(viewModel: .init())
}
