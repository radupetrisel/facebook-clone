//
//  ShortcutsView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 24.03.2024.
//

import SwiftUI

struct ShortcutsView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 15),
        .init(.flexible(), spacing: 15),
    ]
    
    private let shortcutsArray: [Item] = [
        .init(title: "Memories", image: "gobackward"),
        .init(title: "Saved", image: "bookmark.fill"),
        .init(title: "Groups", image: "person.2.circle"),
        .init(title: "Video", image: "play.tv.fill"),
        .init(title: "Marketplace", image: "storefront.fill"),
        .init(title: "Friends", image: "person.2.fill"),
        .init(title: "Feeds", image: "calendar.badge.clock"),
        .init(title: "Events", image: "calendar"),
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your shortcuts")
                .font(.headline)
                .foregroundStyle(.darkGray)
            
            LazyVGrid(columns: gridItems, spacing: 10) {
                ForEach(shortcutsArray) { item in
                    VStack(alignment: .leading, spacing: 10) {
                        Image(systemName: item.image)
                            .foregroundStyle(.blue)
                        
                        Text(item.title)
                            .font(.headline)
                        
                        HStack { Spacer() }
                    }
                    .padding(.horizontal)
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))
                }
            }
            
            Button("See more") {
                
            }
            .buttonStyle(.screenWidthButtonStyle)
            .padding(.vertical, 5)
        }
        .padding(.horizontal)
    }
    
    private struct Item: Identifiable {
        let id = UUID()
        
        let title: String
        let image: String
    }
}

#Preview {
    ShortcutsView()
        .background(.systemGray6)
}
