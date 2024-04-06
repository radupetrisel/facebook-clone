//
//  facebook_cloneApp.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 13.03.2024.
//

import FirebaseCore
import SwiftUI

@main
struct facebook_cloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
