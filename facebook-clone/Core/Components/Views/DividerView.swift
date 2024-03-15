//
//  DividerView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 15.03.2024.
//

import SwiftUI

struct DividerView: View {
    let width: CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundStyle(.quaternary)
            .frame(width: width, height: 6)
    }
}

#Preview {
    DividerView(width: 100)
}
