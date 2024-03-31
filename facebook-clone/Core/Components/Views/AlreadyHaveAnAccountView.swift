//
//  AlreadyHaveAnAccountView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 31.03.2024.
//

import SwiftUI

struct AlreadyHaveAnAccountView: View {
    var body: some View {
        HStack {
            Spacer()
            
            Text("Already have an account?")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)
            
            Spacer()
        }
    }
}

#Preview {
    AlreadyHaveAnAccountView()
}
