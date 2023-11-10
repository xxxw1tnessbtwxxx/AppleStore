//
//  ExplainiPhone.swift
//  courseproject
//
//  Created by Алексей Суровцев on 10.11.2023.
//

import Foundation
import UIKit

class ExplainiPhone: UIViewController {
    
    var get: IPhoneModelAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(with product: IPhoneModelAPI) { self.get = product }
    
}
