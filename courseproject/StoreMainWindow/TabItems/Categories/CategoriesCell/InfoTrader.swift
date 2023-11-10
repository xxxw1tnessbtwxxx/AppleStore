//
//  File.swift
//  courseproject
//
//  Created by Алексей Суровцев on 02.11.2023.
//

import Foundation
import UIKit

final class InfoTrader {
    static let shared = InfoTrader()
    private var productData: [MacModelAPI] = []
    private var totalPrice: Double = 0
    
    func incrementTotalPrice(add value: Double) {
        print(totalPrice)
        self.totalPrice += value
    }
    
    func decrementTotalPrice(remove value: Double) {
        self.totalPrice -= value
    }
    
    func getTotalPrice() -> Double {
        self.totalPrice
    }
    
    func appendProduct(using elem: MacModelAPI) {
        self.productData.append(elem)
    }
    
    
    func downloadProducts() -> [MacModelAPI] {
        return self.productData
    }
    
    func didTapDeletedProduct() {
        
    }
    
}
