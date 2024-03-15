//
//  StoryFeedView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 15.03.2024.
//

import SwiftUI

struct StoryFeedView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCardView()
                
                ForEach(0 ..< 3) { _ in
                    StoryCardView()
                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}

#Preview {
    StoryFeedView()
}
