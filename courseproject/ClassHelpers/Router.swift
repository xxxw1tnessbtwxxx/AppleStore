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
    
}
