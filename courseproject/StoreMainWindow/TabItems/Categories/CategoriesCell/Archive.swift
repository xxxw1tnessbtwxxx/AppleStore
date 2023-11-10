//
//  ProductCellVC.swift
//  courseproject
//
//  Created by Алексей Суровцев on 01.11.2023.
//

import Foundation
import UIKit
import Alamofire
class Archive: UITableViewCell {
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    
    private var productID: Int = 0
    
    func configure(with data: ProductModel) {
        self.productID = data.id
        self.productDescription.text = "\(data.price) руб."
        self.productTitle.text = data.title
        self.productImage.image = UIImage(named: data.image)
        
    }
    @IBAction func didTapOrderButton(_ sender: Any) {
        AF.request("http://127.0.0.1:5000/products?id=\(self.productID)").response { response in
            guard let data = response.data else { return }
            let model = try? JSONDecoder().decode(ProductModel.self, from: data)
            InfoTrader.shared.incrementTotalPrice(add: model!.price)
            InfoTrader.shared.appendProduct(using: model!)
        }.resume()
    }
}

