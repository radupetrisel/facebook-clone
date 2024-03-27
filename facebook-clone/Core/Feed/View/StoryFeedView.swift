//
//  StoryFeedView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 15.03.2024.
//

import SwiftUI

struct StoryFeedView: View {
    let viewModel: FeedViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                MyStoryCardView(user: viewModel.currentUser)
                
                ForEach(viewModel.friends, content: StoryCardView.init(user:))
            }
        }
        .scrollIndicators(.hidden)
        .padding(.vertical, 5)
    }
}

#Preview {
    StoryFeedView(viewModel: .init())
}
