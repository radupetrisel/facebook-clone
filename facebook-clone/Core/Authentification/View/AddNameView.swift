//
//  AddNameView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 30.03.2024.
//

import SwiftUI

struct AddNameView: View {
    @State private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("What's your name?")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Enter the name you use in real life")
                .font(.footnote)
            
            HStack {
                TextField("First name", text: $viewModel.firstName)
                    .textFieldStyle(.loginScreen)
                
                TextField("Surname", text: $viewModel.familyName)
                    .textFieldStyle(.loginScreen)
            }
            
            NavigationLink {
                AgeView(viewModel: viewModel)
                    .navigationBarBackButtonHidden()
            } label: {
                RegistrationNavigationLinkLabel()
            }
            .padding(.vertical)
            
            Spacer()
            
            AlreadyHaveAnAccountView()
        }
        .padding()
        .toolbar { toolbar }
        .background(.systemGray5)
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
        AddNameView()
    }
}
