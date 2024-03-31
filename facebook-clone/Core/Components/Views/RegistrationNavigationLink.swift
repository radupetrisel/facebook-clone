//
//  RegistrationNavigationLink.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 31.03.2024.
//

import SwiftUI

struct RegistrationNavigationLinkLabel<TBackground, TForeground>: View where TBackground: ShapeStyle, TForeground: ShapeStyle {
    let title: String
    let background: TBackground
    let foreground: TForeground
    
    init(title: String = "Next", background: TBackground = Color.blue, foreground: TForeground = Color.white) {
        self.title = title
        self.background = background
        self.foreground = foreground
    }
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(background)
            .foregroundStyle(foreground)
            .clipShape(.capsule)
    }
}

#Preview {
    RegistrationNavigationLinkLabel()
}
