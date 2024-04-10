//
//  FeedView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 14.03.2024.
//

import SwiftUI

struct FeedView: View {
    @State private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HeaderView(viewModel: viewModel)
                    
                    DividerView()
                    
                    StoryFeedView(viewModel: viewModel)
                    
                    DividerView()
                    
                    ForEach(viewModel.posts, content: PostView.init(post:))
                    Spacer()
                }
                .toolbar { toolbar }
            }
            .refreshable { viewModel.fetchPosts() }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Facebook")
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(.facebookBlue)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 24) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFill()
                    .symbolVariant(.circle.fill)
                    .frame(width: 24, height: 24)
                
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .bold()
                
                Image("messenger")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
            }
        }
    }
}

#Preview {
    FeedView()
}
