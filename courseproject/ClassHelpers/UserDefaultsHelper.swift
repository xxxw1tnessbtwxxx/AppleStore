//
//  UserDefaultsHelper.swift
//  courseproject
//
//  Created by Алексей Суровцев on 19.10.2023.
//

import Foundation

class UserDefaultsHelper {
    
    static let shared = UserDefaultsHelper()
    
    func loadLogin() -> String {
        UserDefaults.standard.string(forKey: "currentLogin")!
    }
    
}
