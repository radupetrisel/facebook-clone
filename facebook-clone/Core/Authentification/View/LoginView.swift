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
                    
                    SecureField("Password", text: $viewModel.password)
                        .textContentType(.password)
                        .textFieldStyle(.loginScreen)
                    
                    Button("Login") {
                        Task {
                            await viewModel.login()
                        }
                    }
                    .buttonStyle(.screenWidth(background: .blue))
                    .foregroundStyle(.white)
                    
                    Text("Forgot password?")
                        .semiboldHeadline()
                }
                .padding(.horizontal)
                
                Spacer()
                
                VStack(spacing: 24) {
                    NavigationLink {
                        AddNameView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Create new account")
                            .semiboldHeadline()
                            .frame(height: 44)
                            .frame(maxWidth: .infinity)
                            .background(.clear)
                            .foregroundStyle(.blue)
                            .clipShape(.rect(cornerRadius: 8))
                            .overlay {
                                Capsule()
                                    .stroke(.blue, lineWidth: 1)
                            }
                    }
                    
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
