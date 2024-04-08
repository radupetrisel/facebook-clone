//
//  MarketplaceButton.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 24.03.2024.
//

import SwiftUI

struct MarketplaceButton: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            Text(title)
                .semiboldHeadline()
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .background(.systemGray5)
        .clipShape(.capsule)
    }
}

#Preview {
    MarketplaceButton(title: "Title", imageName: "xmark")
}
