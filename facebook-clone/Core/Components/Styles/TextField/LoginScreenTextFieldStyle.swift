//
//  LoginScreenTextFieldStyle.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 30.03.2024.
//

import Foundation
import SwiftUI

struct LoginScreenTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .textInputAutocapitalization(.never)
            .padding(12)
            .background(.white)
            .frame(maxWidth: .infinity)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension TextFieldStyle where Self == LoginScreenTextFieldStyle {
    static var loginScreen: LoginScreenTextFieldStyle { LoginScreenTextFieldStyle() }
}
