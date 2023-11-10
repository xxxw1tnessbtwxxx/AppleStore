//
//  Router.swift
//  courseproject
//
//  Created by Алексей Суровцев on 03.11.2023.
//

import Foundation
import UIKit
import Alamofire
class Router {
    static let shared = Router()
    
    func pushCategory(from fromvc: UIViewController, category: CategoryClass) {
        let story = UIStoryboard(name: "CategoryProductList", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "CategoryProducts") as! CategoryProductListVC
        vc.setCategory(category: category)
        fromvc.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushProductInfo(from fromvc: UIViewController, product: MacModelAPI) {
        let story = UIStoryboard(name: "ExplainMac", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "ExplainMac") as! ExplainMac
        vc.configure(with: product)
        fromvc.present(vc, animated: true)
    }
    
    func pushProductInfo(from fromvc: UIViewController, product: IPhoneModelAPI) {
        let story = UIStoryboard(name: "ExplainiPhone", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "ExplainiPhone") as! ExplainiPhone
        vc.configure(with: product)
        fromvc.present(vc, animated: true)
    }
    
}
