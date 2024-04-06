//
//  RootView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 06.04.2024.
//

import SwiftUI

struct RootView: View {
    @State private var viewModel = RootViewModel()
    
    var body: some View {
        Group {
            if viewModel.session != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
