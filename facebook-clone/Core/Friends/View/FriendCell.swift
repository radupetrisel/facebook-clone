//
//  FriendCell.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 20.03.2024.
//

import SwiftUI


struct FriendCell: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(.profilePic3)
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .clipShape(.circle)
            
            VStack(alignment: .leading) {
                Text("Thomas Shelby")
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
    FriendCell()
}
