//
//  ProfileHeaderButtonStyle.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 17.03.2024.
//

import Foundation
import SwiftUI

struct ProfileHeaderButtonStyle<TBackground, TForeground>: ButtonStyle where TBackground: ShapeStyle, TForeground: ShapeStyle {
    let background: TBackground
    let foreground: TForeground
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal)
            .frame(height: 34)
            .background(background)
            .foregroundStyle(foreground)
            .font(.footnote)
            .fontWeight(.semibold)
            .clipShape(.rect(cornerRadius: 8))
    }
}

extension ButtonStyle where Self == ProfileHeaderButtonStyle<Color, Color> {
    static var profileHeader: Self { ProfileHeaderButtonStyle(background: .blue, foreground: .white) }
}

extension ButtonStyle where Self == AnyButtonStyle  {
    static func profileHeader<TBackground, TForeground>(
        background: TBackground,
        foreground: TForeground)
    -> ProfileHeaderButtonStyle<TBackground, TForeground> where TBackground: ShapeStyle, TForeground: ShapeStyle {
        ProfileHeaderButtonStyle(background: background, foreground: foreground)
    }
}
