//
//  OrderCell.swift
//  courseproject
//
//  Created by Алексей Суровцев on 27.11.2023.
//

import Foundation
import UIKit

class OrderCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var costLabeel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    
    func configure(with item: OrderList) {
        self.titleLabel.text = item.title
        self.costLabeel.text = item.cost
        self.countLabel.text = item.count
    }
    
}
