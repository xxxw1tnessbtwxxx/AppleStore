//
//  ExplainAirpods.swift
//  courseproject
//
//  Created by Алексей Суровцев on 18.11.2023.
//

import Foundation
import UIKit

class ExplainAirpods: UIViewController {
    
    var item: AirpodsModelAPI?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var requiredBluetooth: UILabel!
    @IBOutlet weak var isAppleTv: UILabel!
    
    @IBOutlet weak var musicLength: UILabel!
    
    @IBOutlet weak var talkLength: UILabel!
    
    @IBOutlet weak var macOS: UILabel!
    @IBOutlet weak var watchOS: UILabel!
    @IBOutlet weak var iOS: UILabel!
    @IBOutlet weak var noiceReduction: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.requiredBluetooth.text =  "Required Bluetooth: \(item!.specs.bluetooth)"
        self.productImage.image = UIImage(named: item!.image)
        self.productTitle.text = "\(item!.title)"
        if (item!.specs.isAppleTV) {
            self.isAppleTv.text = "Apple TV: Yes"
        }
        else {
            self.isAppleTv.text = "Apple TV: No"
        }
        
        self.musicLength.text = "Music Lenth: \(item!.specs.worktime.music)"
        self.talkLength.text = "Talk Length: \(item!.specs.worktime.talking)"
        if (item!.specs.reduction) {
            self.noiceReduction.text = "Noice Reduction: Yes"
        }
        else {
            self.noiceReduction.text = "Noice Reduction: No"
        }
        
        self.iOS.text = "iOS: \(item!.specs.system.iOS)"
        self.watchOS.text = "watchOS: \(item!.specs.system.watchOS)"
        self.macOS.text = "macOS: \(item!.specs.system.macOS)"
        
    }
    
    
    func configure(with item: AirpodsModelAPI) {
        self.item = item
    }
    
    @IBAction func didTapToCartButton(_ sender: Any) {
        Cart.bucket.addProduct(CartItem(title: self.item!.title, price: Double(self.item!.price), image: UIImage(named: self.item!.image)!))
        self.dismiss(animated: true)
    }
}
