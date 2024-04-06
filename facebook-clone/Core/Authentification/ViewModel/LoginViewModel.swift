//
//  LoginViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 30.03.2024.
//

import Foundation

@Observable
final class LoginViewModel {
    var phoneNumberOrEmail: String = ""
    var password: String = ""
    
    func login() async {
        await AuthService.shared.login(email: phoneNumberOrEmail, password: password)
    }
}
