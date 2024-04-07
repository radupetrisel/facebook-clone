//
//  ProfileView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 14.03.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var viewModel = FeedViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    ProfileHeaderView(viewModel: viewModel, width: proxy.size.width)
                    
                    DividerView()
                    
                    ProfileOptionsView()
                    
                    ProfileFriendsView()
                    
                    DividerView()
                    
                    ManageProfilePostsView()
                    
                    ForEach(viewModel.currentUserPosts, content: PostView.init(post:))
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle(viewModel.currentUser.fullName)
            .toolbar { toolbar }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            CustomBackButton()
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Button("Search", systemImage: "magnifyingglass") { }
                .buttonStyle(.navigationButtonStyle)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
