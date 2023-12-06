//
//  CartViewController.swift
//  courseproject
//
//  Created by Алексей Суровцев on 02.11.2023.
//

import Foundation
import UIKit
import AVFoundation
class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, EditCountDelegate {
    
    @IBOutlet weak var deleteGuide: UILabel!
    @IBOutlet weak var cartTitleLabel: UILabel!
    var soundPlayer: AVAudioPlayer?
    
    func iHaveEditedCount() {
        self.orderButton.setTitle("Order: \(Int(Cart.bucket.downloadTotalPrice()))", for: .normal)
    }
    
    
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    
    @IBAction func didTapMyOrderButton(_ sender: Any) {
        if (DataBaseHelper.shared.getOrders(for: self, user: UserDefaultsHelper.shared.loadLogin())?.count) == 0 {
            AlertsCreator.MakePrimitiveAlert(vc: self, title: "Oops", message: "You dont have orders!", buttonTitle: "Thank you!")
            return
        }
        
        Router.shared.pushOrders(from: self)
        
    }
    
    private func order() {
        
        if (!DataBaseHelper.shared.isFieldFilled(from: self, for: UserDefaultsHelper.shared.loadLogin())) {
            return
        }
        let asset = NSDataAsset(name: "applepay")
        soundPlayer = try? AVAudioPlayer(data: asset!.data, fileTypeHint: "mp3")
        soundPlayer!.play()
        for index in 0..<cartTableView.numberOfRows(inSection: 0) {
            let cell = cartTableView.cellForRow(at: IndexPath(row: index, section: 0)) as! CartCell
            DataBaseHelper.shared.createOrder(for: self, UserDefaultsHelper.shared.loadLogin(), data: cell.gettedItem!.title, String(cell.gettedItem!.price), String(cell.thisOrderCounter))
            Cart.bucket.decreaseTotalPrice(value: cell.gettedItem!.price, cell.thisOrderCounter)
            cell.resetCell()
        }
        
        Cart.bucket.dispose()
        self.cartData.removeAll()
        self.cartTableView.reloadData()
        self.orderButton.setTitle("Order: \(Int(Cart.bucket.downloadTotalPrice()))", for: .normal)
    }
    
    @IBAction func didTapOrderButton(_ sender: Any) {
        let controller = UIAlertController(title: "Are you sure?", message: "You want to order items in your table?", preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: "Yes", style: .default) { action in
            self.order()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        controller.addAction(cancelAction)
        controller.addAction(acceptAction)
        self.present(controller, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cartData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.configure(order: item)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        cartData.remove(at: indexPath.row)
        let cell = tableView.cellForRow(at: indexPath) as! CartCell
        Cart.bucket.decreaseTotalPrice(value: cell.gettedItem!.price, cell.thisOrderCounter)
        Cart.bucket.deleteProduct(at: indexPath.row)
        cell.resetCell()
        
        self.orderButton.setTitle("Order: \(Int(Cart.bucket.downloadTotalPrice()))", for: .normal)
 
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.cartTitleLabel.alpha = 0
        self.deleteGuide.alpha = 0
    }
    
    func changeGuideColor() {
        UIView.animate(withDuration: 6) {
            self.deleteGuide.textColor = .gray
        }
        self.deleteGuide.textColor = .gray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 3) {
            self.cartTitleLabel.alpha = 1
            self.deleteGuide.alpha = 1
        } completion: { variable in
            self.changeGuideColor()
        }

        
        
        
        super.viewDidAppear(animated)
        cartData = Cart.bucket.returnData()
        self.orderButton.setTitle("Order: \(Int(Cart.bucket.downloadTotalPrice()))", for: .normal)
        self.cartTableView.reloadData()
    }
        
    
}
