//
//  ProfileOptionsView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 18.03.2024.
//

import SwiftUI

struct ProfileOptionsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 24) {
                Text("Posts")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                    .padding(.horizontal)
                    .padding(.vertical, 7)
                    .background(Color(.systemGray5))
                    .clipShape(.rect(cornerRadius: 30))
                
                Text("Photos")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.darkGray)
                
                Text("Reels")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.darkGray)
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}


#Preview {
    ProfileOptionsView()
}
