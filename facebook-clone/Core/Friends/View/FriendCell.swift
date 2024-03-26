//
//  FriendCell.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 20.03.2024.
//

import SwiftUI


struct FriendCell: View {
    let user: User
    
    var body: some View {
        HStack(alignment: .top) {
            Image(user.profileImageName ?? "")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("\(user.firstName) \(user.familyName)")
                    .semiboldHeadline()
                
                HStack {
                    Button("Confirm") { }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 8))
                    
                    Button("Delete") { }
                        .foregroundStyle(.black)
                        .tint(.systemGray5)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.roundedRectangle(radius: 8))
                }
            }
        }
    }
}

#Preview {
    FriendCell(user: FriendsViewModel().users[0])
}
