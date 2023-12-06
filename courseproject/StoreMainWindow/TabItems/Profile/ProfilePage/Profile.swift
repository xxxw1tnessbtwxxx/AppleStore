//
//  ProfileVC.swift
//  courseproject
//
//  Created by Алексей Суровцев on 12.10.2023.
//

import Foundation
import UIKit

class Profile: UIViewController, DismissDelegate {
    
    func editDismiss(ended edit: Bool) {
        uploadInfo()
    }
    
    
    @IBOutlet weak var nameInfoLabel: UILabel!
    @IBOutlet weak var surnameInfoLabel: UILabel!
    @IBOutlet weak var addressInfoLabel: UILabel!
    @IBOutlet weak var postcodeInfoLabel: UILabel!
    
    weak var delegate: DismissDelegate?
    var userData: User?
    
    func uploadInfo() {
        userData = DataBaseHelper.shared.loadUserInformation()
        nameInfoLabel.text = userData?.name
        surnameInfoLabel.text = userData?.surname
        addressInfoLabel.text = userData?.livingAddress
        postcodeInfoLabel.text = userData?.postname
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        uploadInfo()
    }
    
    
    
    @IBAction func didTapLogoutButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        let keys = UserDefaults.standard.dictionaryRepresentation().keys
        keys.forEach { keys in
            UserDefaults.standard.removeObject(forKey: keys)
        }
    }
    
    

    @IBAction func didTapEditButton(_ sender: Any) {
        let story = UIStoryboard(name: "EditProfileInfoBoard", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "EditProfileInfo") as! EditProfileInfo
        vc.delegate = self
        self.present(vc, animated: true)

    }
    
}
