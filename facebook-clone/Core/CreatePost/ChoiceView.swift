//
//  ChoiceView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 08.04.2024.
//

import SwiftUI

struct ChoiceView: View {
    let image: String
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: image)
                .frame(width: 14, height: 12)
            
            Text(text)
                .font(.subheadline)
                .fontWeight(.bold)
            
            Image(systemName: "arrowtriangle.down")
                .symbolVariant(.fill)
                .font(.caption2)
        }
        .foregroundStyle(.blue)
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(.systemGray6)
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    ChoiceView(image: "xmark", text: "test")
}
