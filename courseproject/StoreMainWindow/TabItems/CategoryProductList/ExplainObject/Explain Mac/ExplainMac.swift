//
//  ExplainMac.swift
//  courseproject
//
//  Created by Алексей Суровцев on 10.11.2023.
//

import Foundation
import UIKit

class ExplainMac: UIViewController {
    
    @IBOutlet weak var macImage: UIImageView!
    @IBOutlet weak var macName: UILabel!
    @IBOutlet weak var cpu: UILabel!
    @IBOutlet weak var gpu: UILabel!
    @IBOutlet weak var ram: UILabel!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var touchID: UILabel!
    
    var get: MacModelAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        macImage.image = UIImage(named: get!.image)
        macName.text = get!.title
        cpu.text = "CPU: \(get!.specs.cpu)"
        gpu.text = "GPU: \(get!.specs.gpu)"
        ram.text = "RAM: \(get!.specs.ram)"
        display.text = "Display: \(get!.specs.screen)"
        if (get!.other.touchID) {
            self.touchID.text = "Touch ID: Yes"
        }
        else {
            self.touchID.text = "Touch ID: No"
        }
        
    }
    
    
    func configure(with item: MacModelAPI) { self.get = item }
    
    @IBAction func didTapCartButton(_ sender: Any) {
        Cart.bucket.addProduct(CartItem(title: self.get!.title, price: Double(self.get!.price), image: UIImage(named: self.get!.image)!))
        self.dismiss(animated: true)
    }
        
}
