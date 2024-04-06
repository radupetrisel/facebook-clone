//
//  RootViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 06.04.2024.
//

import Foundation
import Firebase
import Observation

@Observable
final class RootViewModel {
    var session: FirebaseAuth.User? { AuthService.shared.session }
}
