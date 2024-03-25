//
//  DividerView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 15.03.2024.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(.quaternary)
            .frame(height: 6)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    DividerView()
}
