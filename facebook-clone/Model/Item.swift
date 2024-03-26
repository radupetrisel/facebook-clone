//
//  Item.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 26.03.2024.
//

import Foundation

struct Item: Identifiable, Hashable, Codable {
    let id: String
    
    var name: String
    var price: Int
    var imageName: String
    
}
