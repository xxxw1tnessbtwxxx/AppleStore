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
    
    /// Function for clear cart
    func dispose() {
        self.data.removeAll()
        self.totalPrice = 0
    }
    
    /// Function for interaction with cart total price
    func changeTotalPrice(value: Double) {
        self.totalPrice += value
    }
    
    /// Function for deleting row
    func decreaseTotalPrice(value: Double, _ times: Int) {
        self.totalPrice -= (Double(value * Double(times)))
    }
    
    /// Function for delete a product from bucket
    func deleteProduct(at: Int) {
        self.data.remove(at: at)
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
