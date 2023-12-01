//
//  Orders.swift
//  courseproject
//
//  Created by Алексей Суровцев on 27.11.2023.
//

import Foundation
import UIKit

class Orders: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataBaseHelper.shared.getOrders(for: self, user: UserDefaultsHelper.shared.loadLogin())!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = data![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell") as! OrderCell
        cell.configure(with: product)
        return cell
    }
    
    var data: [OrderList]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.data = DataBaseHelper.shared.getOrders(for: self, user: UserDefaultsHelper.shared.loadLogin())!
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let nib = UINib(nibName: "OrderCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "OrderCell")
        
        
        
    }
    
    
    
}
