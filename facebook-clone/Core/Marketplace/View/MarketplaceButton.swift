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
    let width: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            Text(title)
                .semiboldHeadline()
        }
        .frame(width: width * 0.45, height: 44)
        .background(.systemGray5)
        .clipShape(.capsule)
    }
}

#Preview {
    GeometryReader { proxy in
        MarketplaceButton(title: "Title", imageName: "xmark", width: proxy.size.width)
    }
}
