//
//  RegistrationViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 30.03.2024.
//

import Foundation

@Observable
final class RegistrationViewModel {
    var firstName: String = ""
    var familyName: String = ""
    
    var gender: GenderChoice = .male
    let genderChoices: [GenderChoice] = GenderChoice.allCases
    
    var age: Int = 18
    
    var email: String = ""
    
    var password: String = ""
    
    func createUser() async {
        await AuthService.shared.addUser(firstName: firstName, familyName: familyName, email: email.trimmingCharacters(in: .whitespacesAndNewlines), age: age, gender: gender.rawValue, password: password)
    }
}

enum GenderChoice: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case other = "More options"
    
    var description: String? {
        switch self {
        case .other:
            "Select \"More options\" to choose another gender or if you'd rather not say"
        default:
            nil
        }
    }
}
