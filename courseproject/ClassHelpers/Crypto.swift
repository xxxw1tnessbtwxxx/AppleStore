//
//  Cryto.swift
//  courseproject
//
//  Created by Алексей Суровцев on 18.10.2023.
//

import Foundation
import CryptoKit
class CryptoLibrary {
    static let shared = CryptoLibrary()
    
    func hashPassword(password: String) -> String {
        
        let hash = SHA256.hash(data: password.data(using: .utf8)!)

        let hashString = hash.map { String(format: "%02x", $0) }.joined()

        return hashString
    }
    
}
