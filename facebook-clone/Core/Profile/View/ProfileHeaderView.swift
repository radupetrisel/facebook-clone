//
//  ProfileHeaderView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 17.03.2024.
//

import SwiftUI


struct ProfileHeaderView: View {
    let width: CGFloat
    
    var body: some View {
        VStack {
            Image("cover_picture")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: 250)
            
            Color.white
                .frame(height: 180)
        }
        .overlay {
            VStack(alignment: .leading) {
                Image("profilePic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .stroke(Color(.systemGray6), lineWidth: 3)
                    }
                    .padding(.top, 170)
                
                Text("Omar Thamri")
                    .font(.title)
                    .bold()
                
                Text("4 ")
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
        ProfileHeaderView(width: proxy.size.width)
    }
}
