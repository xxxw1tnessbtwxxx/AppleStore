//
//  EditProfileInfo.swift
//  courseproject
//
//  Created by Алексей Суровцев on 17.10.2023.
//

import Foundation
import UIKit

class EditProfileInfo: UIViewController {
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var livingAddressTextField: UITextField!
    @IBOutlet var postcodeTextField: UITextField!
    
    weak var delegate: DismissDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func validateData() -> ValidateErrors? {
        
        
        if nameTextField.text?.isEmpty == true {
            return .nameError
        }
        else if surnameTextField.text?.isEmpty == true {
            return .surnameError
        }
        else if livingAddressTextField.text?.isEmpty == true {
            return .livingAddressError
        }
        else if postcodeTextField.text?.isEmpty == true {
            return .postcodeError
        }
        return nil
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
        let result = validateData()
        switch (result) {
        case .nameError:
            AlertsCreator.MakePrimitiveAlert(vc: self, title: "Error!", message: "Name field is empty!", buttonTitle: "Retry")
            return
        case .surnameError:
            AlertsCreator.MakePrimitiveAlert(vc: self, title: "Error!", message: "Surname field is empty!", buttonTitle: "Retry")
            return
        case .livingAddressError:
            AlertsCreator.MakePrimitiveAlert(vc: self, title: "Error!", message: "Wrong living address!", buttonTitle: "Retry")
            return
        case .postcodeError:
            AlertsCreator.MakePrimitiveAlert(vc: self, title: "Error!", message: "Wrong postcode!", buttonTitle: "Retry")
            return
        case .none:
            self.dismiss(animated: true)
            if (DataBaseHelper.shared.updateProfileInfo(set: self.nameTextField.text!, self.surnameTextField.text!, self.livingAddressTextField.text!, self.postcodeTextField.text!)) {
                AlertsCreator.MakePrimitiveAlert(vc: self.presentingViewController!, title: "Success!", message: "Profile info updated", buttonTitle: "Thank you!")
                delegate?.editDismiss(ended: true)
            }
            else {
                AlertsCreator.createErrorAlert(self)
            }
        }

    }
    
}
