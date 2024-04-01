//
//  GenderView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 31.03.2024.
//

import SwiftUI

struct GenderView: View {
    @State private var viewModel: RegistrationViewModel
    
    init(viewModel: RegistrationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("What's your gender?")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("You can change who can see your gender on your profile later")
                .font(.footnote)
            
            VStack(alignment: .leading, spacing: 24) {
                ForEach(viewModel.genderChoices, id: \.self) { gender in
                    Button {
                        viewModel.gender = gender
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(gender.rawValue)
                                    .semiboldHeadline()
                                
                                if let description = gender.description {
                                    Text(description)
                                        .font(.subheadline)
                                        .foregroundStyle(.darkGray)
                                        .multilineTextAlignment(.leading)
                                        .padding(.trailing)
                                }
                            }
                            
                            Spacer()
                            
                            Circle()
                                .stroke(viewModel.gender == gender ? .blue : .gray, lineWidth: 1)
                                .frame(width: 25, height: 25)
                                .overlay {
                                    if viewModel.gender == gender {
                                        Circle()
                                            .frame(width: 15, height: 15)
                                            .foregroundStyle(.blue)
                                    }
                                }
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            
            NavigationLink {
                AddEmailView(viewModel: viewModel)
                    .navigationBarBackButtonHidden()
            } label: {
                RegistrationNavigationLinkLabel()
            }
            .padding(.vertical)
            
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
        GenderView(viewModel: RegistrationViewModel())
    }
}
