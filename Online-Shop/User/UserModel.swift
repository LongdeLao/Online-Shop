//
//  UserModel.swift
//  Online-Shop
//
//  Created by Longde Lao on 28.07.24.
//

import Foundation
import Observation

@Observable
class User {
    var itemsInBasket: [[ItemModel]]
    var totalItemCount = 0
    
    init(itemsInBasket: [[ItemModel]] = []) {
        self.itemsInBasket = itemsInBasket
    }
}
