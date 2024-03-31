//
//  CustomBackButton.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 31.03.2024.
//

import SwiftUI

struct CustomBackButton: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Back", systemImage: "arrow.left") { dismiss() }
            .buttonStyle(.navigationButtonStyle)
    }
}

#Preview {
    CustomBackButton()
}
