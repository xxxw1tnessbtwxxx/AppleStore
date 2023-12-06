//
//  Router.swift
//  courseproject
//
//  Created by Алексей Суровцев on 03.11.2023.
//

import Foundation
import UIKit
import Alamofire
final class Router {
    static let shared = Router()
    
    func pushCategory(from fromvc: UIViewController, category: CategoryClass) {
        let story = UIStoryboard(name: "CategoryProductList", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "CategoryProducts") as! CategoryProductListVC
        vc.setCategory(category: category)
        fromvc.navigationController?.pushViewController(vc, animated: true)
    }
    
    /// Function that pushing Mac info
    func pushProductInfo(from fromvc: UIViewController, product: MacModelAPI) {
        let vc = UIStoryboard(name: "ExplainMac", bundle: nil).instantiateViewController(withIdentifier: "ExplainMac") as! ExplainMac
        vc.configure(with: product)
        fromvc.present(vc, animated: true)
    }
    
    /// Function that pushing iPhone info
    func pushProductInfo(from fromvc: UIViewController, product: IPhoneModelAPI) {
        
        let vc = UIStoryboard(name: "ExplainiPhone", bundle: nil).instantiateViewController(withIdentifier: "ExplainiPhone") as! ExplainiPhone
        
        vc.configure(with: product)
        fromvc.present(vc, animated: true)
    }
    
    /// Function that pushing iPad info
    func pushProductInfo(from fromvc: UIViewController, product: iPadModelAPI) {
        
        let vc = UIStoryboard(name: "ExplainiPad", bundle: nil).instantiateViewController(withIdentifier: "ExplainiPad") as! ExplainiPad
        
        vc.configure(with: product)
        fromvc.present(vc, animated: true)
    }
    
    func pushProductInfo(from fromvc: UIViewController, product: AirpodsModelAPI) {
        
        let vc = UIStoryboard(name: "ExplainAirpods", bundle: nil).instantiateViewController(withIdentifier: "ExplainAirpods") as! ExplainAirpods
        vc.configure(with: product)
        fromvc.present(vc, animated: true)
    }
    
    func pushOrders(from fromvc: UIViewController) {
        let vc = UIStoryboard(name: "Orders", bundle: nil).instantiateViewController(withIdentifier: "Orders") as! Orders
        fromvc.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushAuthorization(from fromvc: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainPage") as! ViewController
        fromvc.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushRegistration(from fromvc: UIViewController) {
        let vc = UIStoryboard(name: "RegisterPage", bundle: nil).instantiateViewController(withIdentifier: "RegisterPage") as! RegisterPageVC
        fromvc.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushTabBar(from fromvc: UIViewController, setlogin: String) {
        let story = UIStoryboard(name: "TabBarController", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        UserDefaults.standard.setValue(setlogin, forKey: "currentLogin")
        fromvc.navigationController?.pushViewController(vc, animated: true)
    }
    
}
