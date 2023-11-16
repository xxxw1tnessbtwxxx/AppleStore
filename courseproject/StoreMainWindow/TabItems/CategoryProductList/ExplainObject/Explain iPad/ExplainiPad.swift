//
//  File.swift
//  courseproject
//
//  Created by Алексей Суровцев on 11.11.2023.
//

import Foundation
import UIKit

class ExplainiPad: UIViewController {
    
    var get: iPadModelAPI?
    
    @IBOutlet weak var ipadimage: UIImageView!
    @IBOutlet weak var ipadName: UILabel!
    @IBOutlet weak var cpu: UILabel!
    @IBOutlet weak var memory: UILabel!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var screensize: UILabel!
    @IBOutlet weak var colors: UILabel!
    @IBOutlet weak var security: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ipadimage.image = UIImage(named: get!.image)
        self.ipadName.text = get!.title
        self.cpu.text = "CPU: \(get!.specs.cpu)"
        self.memory.text = "Available memory: \(get!.specs.memory)"
        self.display.text = "Display technology: \(get!.specs.display)"
        self.screensize.text = "Screensize: \(get!.specs.screensize)"
        self.colors.text = "Colors: \(get!.other.colors)"
        self.security.text = "Security: \(get!.other.securitytechnology)"
    }
    
    func configure(with item: iPadModelAPI) {
        self.get = item
    }
    
    @IBAction func didTapCartButton(_ sender: Any) {
        Cart.bucket.addProduct(CartItem(title: self.get!.title, price: Double(self.get!.price), image: UIImage(named: self.get!.image)!))
        self.dismiss(animated: true)
    }
}
