//
//  StoryCardView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 15.03.2024.
//

import SwiftUI

struct StoryCardView: View {
    var body: some View {
        Image("Story1")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 170)
            .clipShape(.rect(cornerRadius: 15))
            .overlay {
                VStack(alignment: .leading) {
                    Image("profilePic1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35, height: 35)
                        .clipShape(.circle)
                        .overlay {
                            Circle()
                                .stroke(.blue, lineWidth: 3)
                        }
                    
                    Spacer()
                    
                    Text("Jim Halpert")
                        .foregroundStyle(.white)
                        .font(.system(size: 12, weight: .semibold))
                    
                    HStack { Spacer() }
                }
                .padding(.leading, 8)
                .padding(.vertical, 8)
            }
    }
}

#Preview {
    StoryCardView()
}
