//
//  StoryCardView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 15.03.2024.
//

import SwiftUI

struct StoryCardView: View {
    let user: User
    
    var body: some View {
        AsyncImage(url: user.coverImageURL) { image in
            image
                .resizable()
        } placeholder: {
            Image(.noProfile)
                .resizable()
        }
        .scaledToFill()
        .frame(width: 100, height: 170)
        .clipShape(.rect(cornerRadius: 15))
        .overlay {
            VStack(alignment: .leading) {
                AsyncImage(url: user.profileImageURL) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(.noProfile)
                        .resizable()
                }
                .scaledToFill()
                .frame(width: 35, height: 35)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.blue, lineWidth: 3)
                }
                .padding(.leading, 8)
                
                Spacer()
                
                Text(user.fullName)
                    .foregroundStyle(.white)
                    .font(.system(size: 12, weight: .semibold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 3)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    StoryCardView(user: .preview)
}
