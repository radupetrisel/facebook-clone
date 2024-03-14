//
//  MainTabView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 13.03.2024.
//

import SwiftUI

struct MainTabView: View {
    @State private var tabSelection: Int = 0
    
    var body: some View {
        TabView {
            TabItem(tag: 0, systemImage: "house", tabSelection: $tabSelection) { FeedView() }
            
            TabItem(tag: 1, systemImage: "play.tv", tabSelection: $tabSelection) { Text("Video") }
            
            TabItem(tag: 2, systemImage: "person.2", tabSelection: $tabSelection) { Text("Friends") }
            
            TabItem(tag: 3, imageName: "marketplace", tabSelection: $tabSelection) { Text("Marketplace") }
            
            TabItem(tag: 4, systemImage: "text.justify", tabSelection: $tabSelection) { Text("Menu") }
        }
        .onAppear {
            UITabBar.appearance().barTintColor = .white
        }
    }
    
    private struct TabItem<Content: View>: View {
        private let content: () -> Content
        private let systemImageName: String?
        private let imageName: String?
        let tag: Int
        
        @Binding var tabSelection: Int
        
        init(tag: Int, systemImage: String, tabSelection: Binding<Int>, @ViewBuilder content: @escaping () -> Content) {
            self.tag = tag
            self.systemImageName = systemImage
            self.imageName = nil
            self._tabSelection = tabSelection
            self.content = content
        }
        
        init(tag: Int, imageName: String, tabSelection: Binding<Int>, @ViewBuilder content: @escaping () -> Content) {
            self.tag = tag
            self.systemImageName = nil
            self.imageName = imageName
            self._tabSelection = tabSelection
            self.content = content
        }
        
        var body: some View {
            content()
                .tabItem {
                    if let systemImageName {
                        Image(systemName: systemImageName)
                            .environment(\.symbolVariants, tabSelection == tag ? .fill : .none)
                    } else if let imageName {
                        Image(imageName)
                            .environment(\.symbolVariants, tabSelection == tag ? .fill : .none)
                    }
                }
                .onAppear { tabSelection = tag }
        }
    }
}

#Preview {
    MainTabView()
}
