//
//  ProductListVC.swift
//  courseproject
//
//  Created by Алексей Суровцев on 16.10.2023.
//




import Foundation
import UIKit
import Alamofire
class CategoriesListVC: UIViewController {
    
    var pressed: CategoryType?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    
    
    @IBAction func didTapMacPressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .mac)) }
    
    @IBAction func didTapiPadPressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .ipad)) }
    
    @IBAction func didTapiPhonePressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .iphone)) }
    
    @IBAction func didTapWatchPressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .watch)) }
    
    @IBAction func didTapVisionPressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .vision)) }
    
    @IBAction func didTapAirPodsPressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .airpods)) }
    
    @IBAction func didTapTVHomePressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .tvhome)) }
    @IBAction func didTapAccessoriesPressed() { Router.shared.pushCategory(from: self, category: CategoryClass(category: .accessories)) }
    
}
