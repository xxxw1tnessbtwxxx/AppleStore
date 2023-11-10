//
//  ExplainiPhone.swift
//  courseproject
//
//  Created by Алексей Суровцев on 10.11.2023.
//

import Foundation
import UIKit

class ExplainiPhone: UIViewController {
    
    @IBOutlet weak var iphoneImage: UIImageView!
    @IBOutlet weak var iphoneName: UILabel!
    @IBOutlet weak var iphoneCPU: UILabel!
    @IBOutlet weak var memorys: UILabel!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var screensize: UILabel!
    @IBOutlet weak var colors: UILabel!
    @IBOutlet weak var security: UILabel!
    
    var get: IPhoneModelAPI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iphoneImage.image = UIImage(named: get!.image)
        iphoneName.text = get!.title
        iphoneCPU.text = "CPU: \(get!.specs.cpu)"
        memorys.text = "Available memory: \(get!.specs.memory)"
        display.text = "Display: \(get!.specs.display)"
        screensize.text = "Screensize: \(get!.specs.screensize)"
        colors.text = "Colors: \(get!.other.colors)"
        security.text = "Security: \(get!.other.securitytechnology)"
    }
    
    func configure(with product: IPhoneModelAPI) { self.get = product }
    
}
