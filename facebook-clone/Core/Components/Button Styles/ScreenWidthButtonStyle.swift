//
//  ScreenWidthButtonStyle.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 24.03.2024.
//

import Foundation
import SwiftUI

struct ScreenWidthButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .semiboldHeadline()
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(.systemGray4)
            .clipShape(.rect(cornerRadius: 8))
    }
}

extension ButtonStyle where Self == ScreenWidthButtonStyle {
    static var screenWidthButtonStyle: ScreenWidthButtonStyle { ScreenWidthButtonStyle() }
}
