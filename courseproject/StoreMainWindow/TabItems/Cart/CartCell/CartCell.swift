//
//  CartCellVC.swift
//  courseproject
//
//  Created by Алексей Суровцев on 02.11.2023.
//

import Foundation
import UIKit

class CartCell: UITableViewCell {
    
    var delegate: EditCountDelegate?
    var gettedItem: CartItem?
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderStepper: UIStepper!
    @IBOutlet weak var orderCount: UILabel!
    var thisOrderCounter: Int = 1
    
    
    
    func resetCell() {
        self.orderStepper.value = 1
        self.thisOrderCounter = 1
    }
    
    func configure(order item: CartItem) {
        self.gettedItem = item
        self.orderCount.text =  "Count: \(Int(self.orderStepper.value))"
        self.orderPrice.text = "\(item.price) руб."
        self.orderImage.image = item.image
        self.orderTitle.text = item.title
    }
    
    @IBAction func didTapChangeCount(_ sender: Any) {
        self.orderCount.text = "Count: \(Int(orderStepper.value))"
        if (Int(orderStepper.value) > thisOrderCounter) {
            Cart.bucket.changeTotalPrice(value: gettedItem!.price)
            thisOrderCounter += 1
        }
        else {
            Cart.bucket.changeTotalPrice(value: -gettedItem!.price)
            thisOrderCounter -= 1
        }
        delegate?.iHaveEditedCount()
    }
}
