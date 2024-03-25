//
//  View+Extensions.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 18.03.2024.
//

import Foundation
import SwiftUI

struct SemiboldHeadlineViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
    }
}

extension View {
    func semiboldHeadline() -> some View {
        modifier(SemiboldHeadlineViewModifier())
    }
}
