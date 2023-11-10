
//
//  CategoryLengthModel.swift
//  courseproject
//
//  Created by Алексей Суровцев on 04.11.2023.
//


import Foundation

// MARK: - ProductModel
/// Struct for parse API response about product
struct MacModelAPI: Codable {
    let id: Int
    let image: String
    let other: MacOther
    let price: Int
    let specs: MacSpecs
    let title: String
}

// MARK: - Other
struct MacOther: Codable {
    let touchID: Bool
}

// MARK: - Specs
struct MacSpecs: Codable {
    let cpu, gpu, ram, screen: String
}
