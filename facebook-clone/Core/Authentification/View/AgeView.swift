//
//  AgeView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 31.03.2024.
//

import SwiftUI

struct AgeView: View {
    @State private var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("How old are you?")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            TextField("Age", value: $viewModel.age, format: .number)
                .textFieldStyle(.loginScreen)
            
            VStack {
                NavigationLink {
                    GenderView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    RegistrationNavigationLinkLabel()
                }
                .padding(.top)
                
                NavigationLink {
                    AgeView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                } label: {
                    RegistrationNavigationLinkLabel(title: "Use date of birth", background: .white, foreground: .darkGray)
                }
                .padding(.top)
            }
            
            Spacer()
            
            AlreadyHaveAnAccountView()
        }
        .padding()
        .background(.systemGray5)
        .toolbar { toolbar }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            CustomBackButton()
        }
    }
}

#Preview {
    NavigationStack {
        AgeView(viewModel: RegistrationViewModel())
    }
}
