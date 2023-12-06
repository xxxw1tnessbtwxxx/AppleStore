//
//  ViewController.swift
//  courseproject
//
//  Created by Алексей Суровцев on 09.10.2023.
//

import UIKit
import SQLite
class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var buttonVisiblePassword: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var showPassword: Bool = false
    private var login: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("loaded")
        configureOutlets()
    }

    
    func configureOutlets() {
        self.passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func didRegisterTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "RegisterPage", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterPage") as! 
        RegisterPageVC
        self.present(vc, animated: true)
    }
    
    
    @IBAction func didLoginTap(_ sender: Any) {
        if (DataBaseHelper.shared.isLoginExists(login: self.loginTextField.text!)) {
            if (CryptoLibrary.shared.hashPassword(password: self.passwordTextField.text!) == DataBaseHelper.shared.getPasswordByLogin(loginForCheck: self.loginTextField.text!)) {
                
                Router.shared.pushTabBar(from: self, setlogin: self.loginTextField.text!)
                
                self.loginTextField.text = ""
                self.passwordTextField.text = ""
            }
            else {
                AlertsCreator.MakePrimitiveAlert(vc: self, title: "Error", message: "Wrong password", buttonTitle: "Retry")
            }
        }
        else {
            AlertsCreator.MakePrimitiveAlert(vc: self, title: "Error", message: "Wrong Login", buttonTitle: "Retry")
        }
    }
    
    
    @IBAction func didVisiblePasswordTap(_ sender: Any) {
        if showPassword == false {
            buttonVisiblePassword.setImage(UIImage(systemName: "eye"), for: .normal)
            self.passwordTextField.isSecureTextEntry = false
            showPassword = true
        }
        else if showPassword {
            buttonVisiblePassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            self.passwordTextField.isSecureTextEntry = true
            showPassword = false
        }
    }
}


