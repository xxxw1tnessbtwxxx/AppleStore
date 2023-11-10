//
//  nameError.swift
//  courseproject
//
//  Created by Алексей Суровцев on 17.10.2023.
//

import Foundation

class NameError: Error {
    var msg: String
    
    init(msg: String) {
        self.msg = msg
    }
}
