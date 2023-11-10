//
//  CategoryProductListVC.swift
//  courseproject
//
//  Created by Алексей Суровцев on 03.11.2023.
//

import Foundation
import UIKit
import Alamofire
class CategoryProductListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, EndLoadDelegate {
    
    func iHaveEndLoadProducts() {
        self.productTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        switch(loadCategory!.type) {
        case .mac:
            let item = productData[indexPath.row]
            cell.configure(with: item as! MacModelAPI)
            return cell
        case .ipad:
            break
        case .iphone:
            let item = productData[indexPath.row]
            cell.configure(with: item as! IPhoneModelAPI)
            return cell
        case .watch:
            break
        case .vision:
            break
        case .airpods:
            break
        case .tvhome:
            break
        case .accessories:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = productData[indexPath.row]
        switch(loadCategory!.type) {
        case .mac:
            Router.shared.pushProductInfo(from: self, product: product as! MacModelAPI)
        case .ipad:
            break
        case .iphone:
            Router.shared.pushProductInfo(from: self, product: product as! IPhoneModelAPI)
        case .watch:
            break
        case .vision:
            break
        case .airpods:
            break
        case .tvhome:
            break
        case .accessories:
            break
        }
    }
   
    @IBOutlet weak var productTableView: UITableView!
    var delegate: EndLoadDelegate?
    private var loadCategory: CategoryClass?
    private var productData: [Any] = []
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet var categoryTitle: UILabel!
    
    
    
    override func viewDidLoad() {
        self.delegate = self
        productTableView.frame.size.width = UIScreen.main.bounds.width
        self.categoryImage.image = Descriptions.getter.returnImage(forKey: loadCategory!.type)
        self.categoryTitle.text = Descriptions.getter.returnTitle(forKey: loadCategory!.type)
        super.viewDidLoad()
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        self.productTableView.rowHeight = 170
        
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        self.productTableView.register(nib, forCellReuseIdentifier: "ProductCell")
    }
    

    
    private func downloadApiData() {
        for id in 0..<self.loadCategory!.categoryLength! {
            switch self.loadCategory!.type {
            case .mac:
                AF.request("http://127.0.0.1:5000/products?category=\(self.loadCategory!.category)&id=\(id)").response { response in
                    guard let data = response.data else { return }
                    let product = try? JSONDecoder().decode(MacModelAPI.self, from: data)
                    print(product!.title)
                    self.productData.append(product!)
                    self.delegate?.iHaveEndLoadProducts()
                }.resume()
            case .ipad:
                break
            case .iphone:
                AF.request("http://127.0.0.1:5000/products?category=\(self.loadCategory!.category)&id=\(id)").response { response in
                    guard let data = response.data else { return }
                    let product = try? JSONDecoder().decode(IPhoneModelAPI.self, from: data)
                    print(product!.title)
                    self.productData.append(product!)
                    self.delegate?.iHaveEndLoadProducts()
                }.resume()
            case .watch:
                break
            case .vision:
                break
            case .airpods:
                break
            case .tvhome:
                break
            case .accessories:
                break
            }
        }
    }
    
    private func configureTheme() {
        self.categoryImage.image = Descriptions.getter.returnImage(forKey: self.loadCategory!.type)
        self.categoryTitle.text = Descriptions.getter.returnTitle(forKey: self.loadCategory!.type)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.dismiss(animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        downloadApiData()
        self.productTableView.reloadData()
    }
    
    func setCategory(category: CategoryClass) {
        self.loadCategory = category
    }
    
}
