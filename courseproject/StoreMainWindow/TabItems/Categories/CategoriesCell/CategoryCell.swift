//
//  CategoryCell.swift
//  courseproject
//
//  Created by Алексей Суровцев on 03.11.2023.
//

import Foundation
import UIKit

class CategoryCellVC: UITableViewCell {
    
    
    private var gettedItem: CategoryCell?
    
    @IBOutlet weak var categoryName: UIButton!
    func configure(with item: CategoryCell) {
        self.gettedItem = item
        switch (item.cellType) {
        case .mac:
            self.categoryName.setTitle("Mac", for: .normal)
        case .ipad:
            self.categoryName.setTitle("iPad", for: .normal)
        case .iphone:
            self.categoryName.setTitle("iPhone", for: .normal)
        case .watch:
            self.categoryName.setTitle("Apple Watch", for: .normal)
        case .vision:
            self.categoryName.setTitle("Vision", for: .normal)
        case .airpods:
            self.categoryName.setTitle("Airpods", for: .normal)
        case .tvhome:
            self.categoryName.setTitle("TV & Home", for: .normal)
        case .accessories:
            self.categoryName.setTitle("Accessories", for: .normal)
        }
    }
    
    @IBAction func didTapCategoryButton(_ sender: Any) {
        
        
        switch (gettedItem?.cellType) {
        case .mac:
            self.categoryName.setTitle("Mac", for: .normal)
        case .ipad:
            self.categoryName.setTitle("iPad", for: .normal)
        case .iphone:
            self.categoryName.setTitle("iPhone", for: .normal)
        case .watch:
            self.categoryName.setTitle("Apple Watch", for: .normal)
        case .vision:
            self.categoryName.setTitle("Vision", for: .normal)
        case .airpods:
            self.categoryName.setTitle("Airpods", for: .normal)
        case .tvhome:
            self.categoryName.setTitle("TV & Home", for: .normal)
        case .accessories:
            self.categoryName.setTitle("Accessories", for: .normal)
        case .none:
            print("error")
        }
    }
}
