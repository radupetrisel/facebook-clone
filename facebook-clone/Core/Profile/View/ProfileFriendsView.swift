//
//  ProfileFriendsView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 18.03.2024.
//

import SwiftUI

struct ProfileFriendsView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    private let width: CGFloat
    
    init(width: CGFloat) {
        self.width = width
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Friends")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("4 friends")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Text("Find friends")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
            }
            
            LazyVGrid(columns: gridItems) {
                ForEach(0 ..< 4) { _ in
                    VStack {
                        Image("profilePic1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: width / 3 - 20, height: width / 3 - 20)
                            .clipShape(.rect(cornerRadius: 8))
                        
                        Text("Jim Halpert")
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            Text("See all friends")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.darkGray)
                .frame(width: width - 30, height: 44)
                .background(.systemGray5)
                .clipShape(.rect(cornerRadius: 8))
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
}


#Preview {
    GeometryReader { proxy in
        ProfileFriendsView(width: proxy.size.width)
    }
}
