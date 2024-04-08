//
//  MarketplaceView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 21.03.2024.
//

import SwiftUI

struct MarketplaceView: View {
    @State private var viewModel = MarketplaceViewModel()
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    MarketplaceButton(title: "Sell", imageName: "square.and.pencil")
                    MarketplaceButton(title: "Categories", imageName: "list.bullet")
                }
                .padding()
                
                Divider()
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Text("Today's picks")
                            .semiboldHeadline()
                        
                        Spacer()
                        
                        Image(.pin)
                            .resizable()
                            .frame(width: 20, height: 16)
                        
                        Text("London")
                            .font(.subheadline)
                            .foregroundStyle(.blue)
                    }
                    .padding()
                }
                
                GeometryReader { proxy in
                    LazyVGrid(columns: gridItems) {
                        ForEach(viewModel.items) { item in
                            VStack {
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: proxy.size.width * 0.5 - 3, height: proxy.size.width * 0.5 - 3)
                                    .clipped()
                                
                                Text("$\(item.price) - \(item.name)")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .toolbar { toolbar }
            
        }
    }
    
    @ToolbarContentBuilder
    private var toolbar: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Text("Marketplace")
                .font(.title)
                .fontWeight(.bold)
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            HStack(spacing: 24) {
                Image(systemName: "person")
                    .symbolVariant(.fill)
                
                Image(systemName: "magnifyingglass")
            }
            .fontWeight(.bold)
        }
    }
}

#Preview {
    NavigationStack {
        MarketplaceView()
    }
}
