//
//  ExplainMac.swift
//  courseproject
//
//  Created by Алексей Суровцев on 10.11.2023.
//

import Foundation
import UIKit

class ExplainMac: UIViewController {
    
    var get: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(with item: MacModelAPI) {
        self.get = item
    }
    
}
