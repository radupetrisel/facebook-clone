//
//  AgreementScreen.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 01.04.2024.
//

import SwiftUI

struct AgreementView: View {
    @State private var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Agree to Facebook's terms and policies")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("People who use our service may have uploaded your contact information to Facebook.")
                + Text(" Learn more")
                    .foregroundStyle(.blue)
                Text("By tapping")
                + Text(" I agree")
                    .bold()
                + Text(", you agree to create an account and to Facebook's")
                + Text(" terms, Privacy Policy")
                    .foregroundStyle(.blue)
                + Text(" and")
                + Text(" Cookies Policy")
                    .foregroundStyle(.blue)
                
                Text("The")
                + Text(" Privacy Policy")
                    .foregroundStyle(.blue)
                + Text(" describes the way we can use the information we collect when you create an account. For example, we use this information to provide, personalise and improve our products, including ads.")
            }
            .font(.caption)
            
            Button {
                Task {
                    await viewModel.createUser()
                }
            } label: {
                RegistrationNavigationLinkLabel(title: "I agree")
            }
            .padding(.top)
            
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
        AgreementView(viewModel: RegistrationViewModel())
    }
}
