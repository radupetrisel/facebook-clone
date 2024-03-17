//
//  ProfileView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 14.03.2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    ProfileHeaderView(width: proxy.size.width)
                    
                    DividerView(width: proxy.size.width)
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Omar Thamri")
            .toolbar { toolbar }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Back", systemImage: "arrow.left") { dismiss() }
                .buttonStyle(.navigationButtonStyle)
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
