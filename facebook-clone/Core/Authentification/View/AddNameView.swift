//
//  AddNameView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 30.03.2024.
//

import SwiftUI

struct AddNameView: View {
    @Environment(\.dismiss) private var dismiss
    
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
                Text("Age view")
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(height: 44)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .padding(.vertical)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Text("Already have an account?")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                
                Spacer()
            }
        }
        .padding()
        .toolbar { toolbar }
        .background(.systemGray5)
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Back", systemImage: "arrow.backward") {
                dismiss()
            }
            .buttonStyle(.plain)
            .labelStyle(.iconOnly)
            .imageScale(.large)
        }
    }
}

#Preview {
    NavigationStack {
        AddNameView()
    }
}
