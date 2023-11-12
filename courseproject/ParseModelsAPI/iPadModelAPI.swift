//
//  iPadModelAPI.swift
//  courseproject
//
//  Created by Алексей Суровцев on 10.11.2023.
//

import Foundation

// MARK: - IPhoneModelAPI
struct iPadModelAPI: Codable {
    let id: Int
    let image: String
    let other: iPadOther
    let price: Int
    let specs: iPadSpecs
    let title: String
}

// MARK: - Other
struct iPadOther: Codable {
    let colors, securitytechnology: String
}

// MARK: - Specs
struct iPadSpecs: Codable {
    let cpu, display, memory, screensize: String
}
