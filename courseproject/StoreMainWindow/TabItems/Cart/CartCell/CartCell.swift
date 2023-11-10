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
    private var gettedItem: MacModelAPI? = nil
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderStepper: UIStepper!
    @IBOutlet weak var orderCount: UILabel!
    private var thisOrderCounter: Int = 1
    
    func configure(order item: MacModelAPI) {
        self.gettedItem = item
        self.orderCount.text =  "Count: \(Int(self.orderStepper.value))"
        self.orderPrice.text = "\(item.price) руб."
        self.orderImage.image = UIImage(named: item.image)
        self.orderTitle.text = item.title
    }
    
    @IBAction func didTapChangeCount(_ sender: Any) {
        
        InfoTrader.shared.incrementTotalPrice(add: Double(self.gettedItem!.price) * self.orderStepper.value)
        self.orderCount.text = "Count: \(Int(self.orderStepper.value))"
        thisOrderCounter = Int(self.orderStepper.value)
        delegate?.iHaveEditedCount()
    }
}
