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
