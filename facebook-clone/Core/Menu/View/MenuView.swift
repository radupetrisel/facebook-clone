//
//  MenuView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 24.03.2024.
//

import SwiftUI

struct MenuView: View {
    @State private var showLogoutAlert = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    MenuHeaderView()
                    
                    ShortcutsView()
                    
                    MenuCell(title: "Help & Support", imageName: "questionmark.circle.fill")
                    
                    MenuCell(title: "Settings & Privacy", imageName: "gearshape.fill")
                    
                    MenuCell(title: "Also from Meta", imageName: "window.casement.closed")
                    
                    Button("Log Out") {
                        showLogoutAlert.toggle()
                    }
                    .buttonStyle(.screenWidthButtonStyle)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                }
            }
            .scrollIndicators(.hidden)
            .background(.systemGray6)
            .toolbar { toolbar }
            .alert("Log out of your account?", isPresented: $showLogoutAlert) {
                Button("Logout") { }
                Button("Cancel", role: .cancel) { }
            }
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
