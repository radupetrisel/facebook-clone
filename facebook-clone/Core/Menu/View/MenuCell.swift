//
//  MenuCell.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 25.03.2024.
//

import SwiftUI

struct MenuCell: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
            
            HStack(spacing: 15) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
                
                Text(title)
                
                Spacer()
                
                Image(systemName: "chevron.down")
            }
            .font(.headline)
            .padding(.horizontal)
            .padding(.vertical, 7)
        }
    }
}


#Preview {
    MenuCell(title: "Title", imageName: "xmark")
}
