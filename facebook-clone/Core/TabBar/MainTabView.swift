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
            TabItem(text: "Feed", tag: 0, systemImage: "house", tabSelection: $tabSelection)
            
            TabItem(text: "Video", tag: 1, systemImage: "play.tv", tabSelection: $tabSelection)
            
            TabItem(text: "Friends", tag: 2, systemImage: "person.2", tabSelection: $tabSelection)
            
            TabItem(text: "Marketplace", tag: 3, imageName: "marketplace", tabSelection: $tabSelection)
            
            TabItem(text: "Menu", tag: 4, systemImage: "text.justify", tabSelection: $tabSelection)
        }
        .onAppear {
            UITabBar.appearance().barTintColor = .white
        }
    }
    
    private struct TabItem: View {
        private let systemImageName: String?
        private let imageName: String?
        let text: String
        let tag: Int
        
        @Binding var tabSelection: Int
        
        init(text: String, tag: Int, systemImage: String, tabSelection: Binding<Int>) {
            self.text = text
            self.tag = tag
            self.systemImageName = systemImage
            self.imageName = nil
            self._tabSelection = tabSelection
        }
        
        init(text: String, tag: Int, imageName: String, tabSelection: Binding<Int>) {
            self.text = text
            self.tag = tag
            self.systemImageName = nil
            self.imageName = imageName
            self._tabSelection = tabSelection
        }
        
        var body: some View {
            Text(text)
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
