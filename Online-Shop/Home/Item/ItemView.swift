//
//  ItemModel.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import SwiftUI

struct ItemView: View {
    @State private var itemModel = ItemViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(itemModel.products) { product in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: product.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 200)
                            .cornerRadius(10)
                            
                            Text(product.title)
                                .font(.headline)
                                .padding(.top, 5)
                            HStack{
                                Text("$\(product.price, specifier: "%.2f")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                StarRating(rating: product.rating.rate, maxRating: 5)
                                    .scaleEffect(0.8)
                                Text("(\(product.rating.count))")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                            }
                            Text(product.description)
                                .font(.body)
                                .lineLimit(2)
                                .padding(.top, 2)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Products")
            .onAppear {
                itemModel.fetchProducts()
            }
        }
    }
}

#Preview {
    ItemView()
}
