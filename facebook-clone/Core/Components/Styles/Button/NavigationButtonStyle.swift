//
//  NavigationButtonStyle.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 17.03.2024.
//

import Foundation
import SwiftUI

struct NavigationButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.black)
            .fontWeight(.bold)
    }
}

extension ButtonStyle where Self == NavigationButtonStyle {
    static var navigationButtonStyle: NavigationButtonStyle { NavigationButtonStyle() }
}
