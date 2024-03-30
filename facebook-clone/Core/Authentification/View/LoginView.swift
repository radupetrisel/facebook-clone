//
//  LoginView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 30.03.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 70) {
                Spacer()
                Image(.facebookCircle)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                
                VStack(spacing: 24) {
                    TextField("Mobile number or email address", text: $viewModel.phoneNumberOrEmail)
                        .textFieldStyle(.loginScreen)
                    
                    TextField("Password", text: $viewModel.password)
                        .textContentType(.password)
                        .textFieldStyle(.loginScreen)
                    
                    Button("Login") { }
                        .buttonStyle(.screenWidth(background: .blue))
                        .foregroundStyle(.white)
                    
                    Text("Forgot password?")
                        .semiboldHeadline()
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 24) {
                    Button("Create a new account") {
                        
                    }
                    .buttonStyle(.createNewAccount)
                    
                    HStack(spacing: 5) {
                        Image(.meta)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 16, height: 16)
                        
                        Text("Meta")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.darkGray)
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.systemGray5)
        }
    }
}

#Preview {
    LoginView()
}
