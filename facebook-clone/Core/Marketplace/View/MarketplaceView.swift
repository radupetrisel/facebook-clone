//
//  MarketplaceView.swift
//  facebook-clone
//
//  Created by Radu Petrisel on 21.03.2024.
//

import SwiftUI

struct MarketplaceView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    HStack {
                        MarketplaceButton(title: "Sell", imageName: "square.and.pencil", width: proxy.size.width)
                        MarketplaceButton(title: "Categories", imageName: "list.bullet", width: proxy.size.width)
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
                    
                    LazyVGrid(columns: gridItems) {
                        ForEach(0 ..< 6) { _ in
                            VStack {
                                Image(.apartment1)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: proxy.size.width * 0.5 - 3, height: proxy.size.width * 0.5 - 3)
                                    .clipped()
                                
                                Text("$950 - 1 bed 1 bathroom")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .toolbar { toolbar }
            }
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

struct MarketplaceButton: View {
    let title: String
    let imageName: String
    let width: CGFloat
    
    var body: some View {
        HStack {
            Image(systemName: "square.and.pencil")
            
            Text("Sell")
                .semiboldHeadline()
        }
        .frame(width: width * 0.45, height: 44)
        .background(.systemGray5)
        .clipShape(.capsule)
    }
}
