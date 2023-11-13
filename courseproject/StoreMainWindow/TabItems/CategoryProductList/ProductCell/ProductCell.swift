//
//  ProductCell.swift
//  courseproject
//
//  Created by Алексей Суровцев on 06.11.2023.
//

import Foundation
import UIKit

class ProductCell: UITableViewCell {
    
    var itemOfThisCell: Any?
    @IBOutlet weak var toCartButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var productID: Int?
    
    func configure(with item: MacModelAPI) {
        self.titleLabel.text = item.title
        self.costLabel.text = "\(Int(item.price)) руб."
        self.productImage.image = UIImage(named: item.image)
        self.productID = item.id
        self.itemOfThisCell = item
    }
    
    func configure(with item: IPhoneModelAPI) {
        self.titleLabel.text = item.title
        self.costLabel.text = "\(Int(item.price)) руб."
        self.productImage.image = UIImage(named: item.image)
        self.productID = item.id
        self.itemOfThisCell = item
    }
    
    func configure(with item: iPadModelAPI) {
        self.titleLabel.text = item.title
        self.costLabel.text = "\(Int(item.price)) руб."
        self.productImage.image = UIImage(named: item.image)
        self.productID = item.id
        self.itemOfThisCell = item
    }
    
}
