//
//  MarketplaceViewModel.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 26.03.2024.
//

import Foundation

@Observable
final class MarketplaceViewModel {
    var items: [Item] = [
        .init(id: UUID().uuidString, name: "1 bed 1 bathroom", price: 950, imageName: "apartment1"),
        .init(id: UUID().uuidString, name: "1 bed 1 bath flat", price: 800, imageName: "apartment2"),
        .init(id: UUID().uuidString, name: "2015 BMW", price: 2600, imageName: "car1"),
        .init(id: UUID().uuidString, name: "2020 Mercedes", price: 44, imageName: "car2"),
        .init(id: UUID().uuidString, name: "corner sofa", price: 80, imageName: "sofa1"),
        .init(id: UUID().uuidString, name: "corner sofa", price: 86, imageName: "sofa2"),
    ]
    
    
}
