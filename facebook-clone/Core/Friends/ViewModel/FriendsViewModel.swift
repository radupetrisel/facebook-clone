//
//  FriendsViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 26.03.2024.
//

import Foundation

@Observable
final class FriendsViewModel {
    var friendsRequests: [User] { UserService.shared.friendRequests }
}
