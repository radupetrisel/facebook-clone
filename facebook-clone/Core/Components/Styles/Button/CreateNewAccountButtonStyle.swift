//
//  CreateNewAccountButtonStyle.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 30.03.2024.
//

import Foundation
import SwiftUI

struct CreateNewAccountButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .semiboldHeadline()
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(.clear)
            .foregroundStyle(.blue)
            .clipShape(.rect(cornerRadius: 8))
            .overlay {
                Capsule()
                    .stroke(.blue, lineWidth: 1)
            }
    }
}

extension ButtonStyle where Self == CreateNewAccountButtonStyle {
    static var createNewAccount: CreateNewAccountButtonStyle { CreateNewAccountButtonStyle() }
}
