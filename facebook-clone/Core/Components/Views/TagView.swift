//
//  TagView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 20.03.2024.
//

import SwiftUI

struct TagView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.systemGray5)
            .clipShape(.capsule)
    }
}


#Preview {
    TagView(title: "Title")
}
