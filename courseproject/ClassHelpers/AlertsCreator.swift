//
//  AlertsCreator.swift
//  courseproject
//
//  Created by Алексей Суровцев on 09.10.2023.
//

import Foundation
import UIKit

class AlertsCreator {
    
    
    static func MakePrimitiveAlert(vc: UIViewController, title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        vc.present(alert, animated: true)
    }
    
    static func createErrorAlert(_ vc: UIViewController) {
        let alert = UIAlertController(title: "Error!", message: "Something went wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default))
        vc.present(alert, animated: true)
    }
    
}
