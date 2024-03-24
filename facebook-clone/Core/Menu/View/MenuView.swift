//
//  MenuView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 24.03.2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    MenuHeaderView()
                    
                    ShortcutsView()
                }
            }
            .scrollIndicators(.hidden)
            .background(.systemGray6)
            .toolbar { toolbar }
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Menu")
                .font(.title)
                .bold()
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 24) {
                Image(systemName: "gearshape")
                    .symbolVariant(.fill)
                
                Image(systemName: "magnifyingglass")
            }
            .bold()
        }
    }
}

#Preview {
    NavigationStack {
        MenuView()
    }
}
