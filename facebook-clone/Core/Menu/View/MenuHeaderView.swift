//
//  MenuHeaderView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 24.03.2024.
//

import SwiftUI

struct MenuHeaderView: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Image(.profilePic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
                
                Text("Omar Thamri")
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .scaledToFill()
                    .symbolVariant(.circle.fill)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.systemGray3)
            }
            
            Divider()
            
            HStack(spacing: 15) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFill()
                    .symbolVariant(.circle.fill)
                    .frame(width: 30, height: 30)
                
                Text("Create another profile")
                
                Spacer()
            }
            .foregroundStyle(.darkGray)
        }
        .padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    MenuHeaderView()
}
