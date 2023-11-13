//
//  Category.swift
//  courseproject
//
//  Created by Алексей Суровцев on 06.11.2023.
//

import Foundation
import Alamofire

class CategoryClass {
    var wtfArray: [Int] = []
    var type: CategoryType
    var categoryLength: Int?
    var category: String { // FOR API CALL &?category =
        switch (type) {
        case .mac:
            "mac"
        case .ipad:
            "ipad"
        case .iphone:
            "iphone"
        case .watch:
            "watch"
        case .vision:
            "vision"
        case .airpods:
            "airpods"
        case .tvhome:
            "tvhome"
        case .accessories:
            "accessories"
        }
    }
    
    init(category type: CategoryType) {
        self.type = type
        AF.request("http://127.0.0.1:5000/length?category=\(self.category)").response { response in
            print(self.category)
            guard let data = response.data else { print("404"); return }
            let model = try? JSONDecoder().decode(CategoryLengthModel.self, from: data)
            self.categoryLength = model!.categoryLength
        }.resume()
    }
    
}
