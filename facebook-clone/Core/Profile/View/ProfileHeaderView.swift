//
//  ProfileHeaderView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 17.03.2024.
//

import SwiftUI


struct ProfileHeaderView: View {
    let user: User
    let width: CGFloat
    
    var body: some View {
        VStack {
            Image(user.coverImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 250)
            
            Color.white
                .frame(height: 180)
        }
        .overlay {
            VStack(alignment: .leading) {
                Image(user.profileImageName ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .stroke(Color(.systemGray6), lineWidth: 3)
                    }
                    .padding(.top, 170)
                
                Text(user.fullName)
                    .font(.title)
                    .bold()
                
                Text("\(user.friendsIds.count) ")
                    .font(.headline)
                + Text("friends")
                    .font(.headline)
                    .foregroundStyle(.gray)
                
                HStack {
                    Button("Add to story", systemImage: "plus") {
                        
                    }
                    .buttonStyle(.profileHeaderButtonStyle(background: .blue, foreground: .white))
                    
                    Button("Edit profile", systemImage: "pencil") {
                        
                    }
                    .buttonStyle(.profileHeaderButtonStyle(background: .quaternary, foreground: .darkGray))
                    
                    Button("More", systemImage: "ellipsis") {
                        
                    }
                    .labelStyle(.iconOnly)
                    .buttonStyle(.profileHeaderButtonStyle(background: .quaternary, foreground: .darkGray))
                }
                
                HStack {
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    GeometryReader { proxy in
        ProfileHeaderView(user: FeedViewModel().currentUser, width: proxy.size.width)
    }
}
