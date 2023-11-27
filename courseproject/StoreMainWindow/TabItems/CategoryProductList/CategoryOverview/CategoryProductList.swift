//
//  CategoryProductListVC.swift
//  courseproject
//
//  Created by Алексей Суровцев on 03.11.2023.
//

import Foundation
import UIKit
import Alamofire
class CategoryProductListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, EndLoadDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        switch(loadCategory!.type) {
        case .mac:
            let item = productData[indexPath.row]
            cell.configure(with: item as! MacModelAPI)
        case .ipad:
            let item = productData[indexPath.row]
            cell.configure(with: item as! iPadModelAPI)
        case .iphone:
            let item = productData[indexPath.row]
            cell.configure(with: item as! IPhoneModelAPI)
        case .watch:
            break
        case .vision:
            break
        case .airpods:
            let item = productData[indexPath.row]
            cell.configure(with: item as! AirpodsModelAPI)
        case .tvhome:
            break
        case .accessories:
            break
        }
        cell.frame.size = CGSize(width: 220, height: 200)
        cell.setNeedsLayout()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        switch (loadCategory!.type) {
            
        case .mac:
            Router.shared.pushProductInfo(from: self, product: productData[indexPath.row] as! MacModelAPI)
        case .ipad:
            Router.shared.pushProductInfo(from: self, product: productData[indexPath.row] as! iPadModelAPI)
        case .iphone:
            Router.shared.pushProductInfo(from: self, product: productData[indexPath.row] as! IPhoneModelAPI)
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
    
    func iHaveEndLoadProducts() {
        self.collectionView.reloadData()
    }
    


    @IBOutlet weak var collectionView: UICollectionView!
    var delegate: EndLoadDelegate?
    private var loadCategory: CategoryClass?
    private var productData: [Any] = []
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet var categoryTitle: UILabel!
    
 
    override func viewDidLoad() {
        self.delegate = self
        self.categoryImage.image = Descriptions.getter.returnImage(forKey: loadCategory!.type)
        self.categoryTitle.text = Descriptions.getter.returnTitle(forKey: loadCategory!.type)
        
        
        
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width / 2.3, height: 200)

        collectionView.setCollectionViewLayout(layout, animated: false)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        
        
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
                AF.request("http://127.0.0.1:5000/products?category=\(self.loadCategory!.category)&id=\(id)").response { response in
                    guard let data = response.data else { return }
                    let product = try? JSONDecoder().decode(iPadModelAPI.self, from: data)
                    print(product!.title)
                    self.productData.append(product!)
                    self.delegate?.iHaveEndLoadProducts()
                }.resume()
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
                AF.request("http://127.0.0.1:5000/products?category=\(self.loadCategory!.category)&id=\(id)").response { response in
                    guard let data = response.data else { return }
                    let product = try? JSONDecoder().decode(AirpodsModelAPI.self, from: data)
                    print(product!.title)
                    self.productData.append(product!)
                    self.delegate?.iHaveEndLoadProducts()
                }.resume()
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
        self.collectionView.reloadData()
    }
    
    func setCategory(category: CategoryClass) {
        self.loadCategory = category
    }
    
}
