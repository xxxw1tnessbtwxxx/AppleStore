//
//  CartViewController.swift
//  courseproject
//
//  Created by Алексей Суровцев on 02.11.2023.
//

import Foundation
import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditCountDelegate {
    
    
    func iHaveEditedCount() {
        self.totalLabel.text = "Total: \(Cart.bucket.downloadTotalPrice())"
    }
    
    
    @IBOutlet weak var totalLabel: UILabel!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cartData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.configure(order: item)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cartTableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBOutlet weak var cartTableView: UITableView!
    
    var cartData: [CartItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cartTableView.dataSource = self
        self.cartTableView.delegate = self
        let nib = UINib(nibName: "CartCell", bundle: nil)
        self.cartTableView.register(nib, forCellReuseIdentifier: "CartCell")
        self.cartTableView.rowHeight = 150
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartData = Cart.bucket.returnData()
        self.totalLabel.text = "Total: \(Cart.bucket.downloadTotalPrice())"
        self.cartTableView.reloadData()
    }
        
    
}
