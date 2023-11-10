//
//  ProductsListExtension.swift
//  courseproject
//
//  Created by Алексей Суровцев on 30.10.2023.
//

import Foundation
import UIKit

extension ProductListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Заполнить ячейку данными
        cell.textLabel?.text = "Строка \(indexPath.row + 1)"

        return cell
    }
}
