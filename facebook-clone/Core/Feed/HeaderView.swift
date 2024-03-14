//
//  HeaderView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 14.03.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                NavigationLink {
                    ProfileView()
                } label: {
                    Image("profilePic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(.circle)
                }
                
                Button(action: {}) {
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
            .padding(.vertical, 30)
            
            Spacer()
        }
    }
}

#Preview {
    HeaderView()
}
