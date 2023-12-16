//
//  Start.swift
//  courseproject
//
//  Created by Алексей Суровцев on 04.12.2023.
//

import Foundation
import UIKit

class Start: UIViewController {
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var reservedLabel: UILabel!
    @IBOutlet weak var linkbutton: UIButton!
    @IBOutlet weak var applelogo: UIImageView!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signupButton.alpha = 0
        self.reservedLabel.alpha = 0
        self.applelogo.alpha = 0
        self.buttonStart.alpha = 0
        self.titleLabel.alpha = 0
        self.linkbutton.alpha = 0
        
        UIView.animate(withDuration: 3) {
            self.buttonStart.alpha = 1
            self.titleLabel.alpha = 1
            self.signupButton.alpha = 1
            self.linkbutton.alpha = 1
            
        }
        
        UIView.animate(withDuration: 4) {
            self.applelogo.alpha = 1
        }
        
        UIView.animate(withDuration: 2) {
            self.reservedLabel.alpha = 1
        }
        
        
        
    }
        
    @IBAction func didTapContinueButton(_ sender: Any) {
        Router.shared.pushAuthorization(from: self)
    }
    @IBAction func didTapSignButton(_ sender: Any) {
        Router.shared.pushRegistration(from: self)
    }
    @IBAction func didTapLinkButton(_ sender: Any) {
        let websiteURL = URL(string: "https://www.apple.com")!

        UIApplication.shared.open(websiteURL)
    }
}
    
