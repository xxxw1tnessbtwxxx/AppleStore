//
//  Cart.swift
//  courseproject
//
//  Created by Алексей Суровцев on 15.11.2023.
//

import Foundation

final class Cart {
    
    // MARK: Singleton
    static let bucket = Cart()
    
    
    // MARK: - Info
    private var data: [CartItem] = []
    private var totalPrice: Double = 0
    
    // MARK: - Interaction
    
    /// Function for add Cart item
    func addProduct(_ item: CartItem) {
        data.append(item)
        changeTotalPrice(value: item.price)
        print(totalPrice, data.count)
    }
    
    /// Function for interaction with cart total price
    func changeTotalPrice(value: Double) {
        self.totalPrice += value
    }
    
    /// Function for get data
    func returnData() -> [CartItem] {
        self.data
    }
    
    /// Function for get now total price
    func downloadTotalPrice() -> Double {
        self.totalPrice
    }
    
    
}
