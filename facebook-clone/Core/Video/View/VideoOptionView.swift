//
//  VideoOptionView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 25.03.2024.
//

import SwiftUI


struct VideoOptionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    Text("For you")
                        .semiboldHeadline()
                        .foregroundStyle(.blue)
                        .padding(.horizontal)
                        .padding(.vertical, 7)
                        .background(.systemGray5)
                        .clipShape(.capsule)
                    
                    Text("Live")
                        .videoOptionView()
                    
                    Text("Gaming")
                        .videoOptionView()
                    
                    Text("Reels")
                        .videoOptionView()
                    
                    Text("Following")
                        .videoOptionView()
                }
            }
            .contentMargins(.horizontal, 10)
            
            Divider()
        }
        .padding(.vertical)
    }
}

#Preview {
    VideoOptionView()
}
