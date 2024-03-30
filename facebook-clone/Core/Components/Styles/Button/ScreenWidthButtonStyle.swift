//
//  ScreenWidthButtonStyle.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 24.03.2024.
//

import Foundation
import SwiftUI

struct ScreenWidthButtonStyle<TBackground>: ButtonStyle where TBackground: ShapeStyle {
    let background: TBackground
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .semiboldHeadline()
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(background)
            .clipShape(.rect(cornerRadius: 8))
    }
}

extension ButtonStyle where Self == ScreenWidthButtonStyle<Color> {
    static var screenWidth: ScreenWidthButtonStyle<Color> { ScreenWidthButtonStyle(background: .systemGray5) }
}

extension ButtonStyle where Self == AnyButtonStyle {
    static func screenWidth<TBackground>(background: TBackground) -> ScreenWidthButtonStyle<TBackground> where TBackground: ShapeStyle {
        ScreenWidthButtonStyle(background: background)
    }
}
