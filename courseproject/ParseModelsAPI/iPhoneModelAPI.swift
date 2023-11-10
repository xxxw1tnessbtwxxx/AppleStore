//
//  iPhoneModelAPI.swift
//  courseproject
//
//  Created by Алексей Суровцев on 10.11.2023.
//

import Foundation

// MARK: - IPhoneModelAPI
struct IPhoneModelAPI: Codable {
    let id: Int
    let image: String
    let other: iPhoneOther
    let price: Int
    let specs: iPhoneSpecs
    let title: String
}

// MARK: - Other
struct iPhoneOther: Codable {
    let colors, securitytechnology: String
}

// MARK: - Specs
struct iPhoneSpecs: Codable {
    let cpu, display, memory, screensize: String
}
