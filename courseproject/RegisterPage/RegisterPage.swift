//
//  RegisterPageViewController.swift
//  courseproject
//
//  Created by Алексей Суровцев on 09.10.2023.
//

import Foundation
import UIKit
import SQLite
import CryptoKit
class RegisterPageVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var currentRegisterType: RegisterType? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkFieldData() {
        let mail = self.emailTextField.text!
        if (emailTextField.text?.isEmpty != true) && (loginTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false) {
            
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            if mail.range(of: emailRegex, options: .regularExpression) != nil {
                self.currentRegisterType = .withEmail
            }
            else {
                AlertsCreator.MakePrimitiveAlert(vc: self, title: "Wrong mail!", message: "Please, enter the correct mail type", buttonTitle: "Retry")
                return
            }
        }
        
        else if (emailTextField.text?.isEmpty == true) && (loginTextField.text?.isEmpty != true) && (passwordTextField.text?.isEmpty != true) {
            self.currentRegisterType = .withoutEmail
        }
        else {
            AlertsCreator.MakePrimitiveAlert(vc: self, title: "Error!", message: "Login or Password field is empty", buttonTitle: "Retry")
        }
    }
    
    @IBAction func didTapRegisterButton(_ sender: Any) {
        
        checkFieldData()
        switch (self.currentRegisterType) {
        case .withoutEmail:
            
            DataBaseHelper.shared.registerUser(from: self, login: self.loginTextField.text!, password: CryptoLibrary.shared.hashPassword(password: self.passwordTextField.text!), email: nil)
            	
            Router.shared.pushTabBar(from: self, setlogin: self.loginTextField.text!)
            break
            
        case .withEmail:
            
            DataBaseHelper.shared.registerUser(from: self, login: self.loginTextField.text!, password: CryptoLibrary.shared.hashPassword(password: self.passwordTextField.text!), email: self.emailTextField.text!)
            self.dismiss(animated: true)
            Router.shared.pushTabBar(from: self, setlogin: self.loginTextField.text!)
            break
            
        case .none:
            print("error")
        }
    }
}

