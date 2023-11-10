//
//  Category.swift
//  courseproject
//
//  Created by Алексей Суровцев on 06.11.2023.
//

import Foundation

class CategoryClass {
    var type: CategoryType
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
    }
    
}
