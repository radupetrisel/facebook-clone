//
//  ProfileFriendsView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 18.03.2024.
//

import SwiftUI

struct ProfileFriendsView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 20),
        .init(.flexible(), spacing: 20),
        .init(.flexible(), spacing: 20),
    ]
    
    @State private var viewModel = FeedViewModel()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Friends")
                        .semiboldHeadline()
                    
                    Text("\(viewModel.friends.count) friends")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Text("Find friends")
                    .semiboldHeadline()
                    .foregroundStyle(.blue)
            }
            
            LazyVGrid(columns: gridItems) {
                ForEach(viewModel.friends) { user in
                    VStack {
                        AsyncImage(url: URL(string: user.profileImageName ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .clipShape(.rect(cornerRadius: 8))
                            
                        } placeholder: {
                            Image(.noProfile)
                                .resizable()
                                .scaledToFill()
                                .clipShape(.rect(cornerRadius: 8))

                        }
                        
                        Text(user.fullName)
                            .lineLimit(1)
                            .semiboldHeadline()
                    }
                }
            }
            
            Text("See all friends")
                .semiboldHeadline()
                .foregroundStyle(.darkGray)
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                .background(.systemGray5)
                .clipShape(.rect(cornerRadius: 8))
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
}


#Preview {
    GeometryReader { proxy in
        ProfileFriendsView()
    }
}
