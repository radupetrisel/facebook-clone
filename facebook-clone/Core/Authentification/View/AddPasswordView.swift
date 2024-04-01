//
//  AddPasswordView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 01.04.2024.
//

import SwiftUI

struct AddPasswordView: View {
    @State private var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Create a password whith at least 6 letters or numbers. It should be something that others can't guess.")
                .font(.footnote)
            
            SecureField("Password", text: $viewModel.password)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .textFieldStyle(.loginScreen)
            
            NavigationLink {
                AgreementView()
                    .navigationBarBackButtonHidden()
            } label: {
                RegistrationNavigationLinkLabel()
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
        AddPasswordView(viewModel: RegistrationViewModel())
    }
}
