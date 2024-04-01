//
//  AddEmailView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 01.04.2024.
//

import SwiftUI

struct AddEmailView: View {
    @State private var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("What's your email address?")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Enter the email address at which you can be contacted. No one will see this on your profile.")
                .font(.footnote)
            
            TextField("Email address", text: $viewModel.email)
                .textFieldStyle(.loginScreen)
            
            Group {
                Text("You'll also recieve emails trom us and can opt out anytime.")
                + Text(" Learn more")
                    .foregroundStyle(.blue)
            }
            .font(.footnote)
            
            NavigationLink {
                Text("destination")
            } label: {
                RegistrationNavigationLinkLabel()
            }
            .padding(.top)

            NavigationLink {
                Text("destination")
            } label: {
                RegistrationNavigationLinkLabel(title: "Sign up with Mobile Number", background: .white, foreground: .darkGray)
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
        AddEmailView(viewModel: RegistrationViewModel())
    }
}
