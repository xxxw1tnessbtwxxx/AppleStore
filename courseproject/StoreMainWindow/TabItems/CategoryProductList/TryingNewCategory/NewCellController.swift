//
//  NewCellController.swift
//  courseproject
//
//  Created by Алексей Суровцев on 13.11.2023.
//

import Foundation
import UIKit

class NewCellController: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with text: String) {
        self.label.text = text
    }
    
}
