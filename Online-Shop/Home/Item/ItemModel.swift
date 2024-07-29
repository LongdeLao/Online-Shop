//
//  ProductModel.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import Foundation



struct ProductResponse: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    struct Rating: Codable {
        let rate: Double
        let count: Int
    }
}


struct ItemModel: Codable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
    struct Rating: Codable {
        let rate: Double
        let count: Int
    }
    
    // individual properties can be added before but must have a default value. Additionally fetchProducts has to be updated
    var count = 0
    

}
