//
//  VideoOptionViewModifier.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 25.03.2024.
//

import Foundation
import SwiftUI

struct VideoOptionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .semiboldHeadline()
            .foregroundStyle(.darkGray)
    }
}

extension View {
    func videoOptionView() -> some View {
        modifier(VideoOptionViewModifier())
    }
}
