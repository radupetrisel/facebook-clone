//
//  FriendsView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 20.03.2024.
//

import SwiftUI

struct FriendsView: View {
    @State private var viewModel = FriendsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        TagView(title: "Suggestions")
                        
                        TagView(title: "Your friends")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    HStack {
                        Text("Friend requests")
                            .semiboldHeadline()
                        
                        Text(String(viewModel.friendsRequests.count))
                            .semiboldHeadline()
                            .foregroundStyle(.red)
                        
                        Spacer()
                        
                        Button("See all") { }
                    }
                    .padding(.horizontal)
                    
                    ForEach(viewModel.friendsRequests, content: FriendCell.init(user:))
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
            .toolbar { toolbar }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Friends")
                .font(.title)
                .fontWeight(.bold)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            Image(systemName: "magnifyingglass")
                .bold()
        }
    }
}

#Preview {
    NavigationStack {
        FriendsView()
    }
}
