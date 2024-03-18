//
//  ProfilePostButton.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 18.03.2024.
//

import SwiftUI

struct ProfilePostButton: View {
    let title: String
    let systemImage: String
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: systemImage)
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 16)
                .foregroundStyle(.red)
            
            Text(title)
                .semiboldHeadline()
                .foregroundStyle(.darkGray)
        }
        .padding(.horizontal, 25)
        .padding(.vertical, 8)
        .background(.white)
        .clipShape(.rect(cornerRadius: 30))
    }
}


#Preview {
    ProfilePostButton(title: "Reel", systemImage: "play.rectangle.fill")
}
