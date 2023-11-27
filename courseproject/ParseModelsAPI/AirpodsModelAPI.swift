import Foundation

// MARK: - AirpodsModelAPI
struct AirpodsModelAPI: Codable {
    let id: Int
    let image: String
    let price: Int
    let specs: AirpodsSpecs
    let title: String
}

// MARK: - Specs
struct AirpodsSpecs: Codable {
    let bluetooth: String
    let isAppleTV, reduction: Bool
    let system: AirpodsSystem
    let worktime: AirpodsWorktime
}

// MARK: - System
struct AirpodsSystem: Codable {
    let iOS, macOS, watchOS: String
}

// MARK: - Worktime
struct AirpodsWorktime: Codable {
    let music, talking: Int
}
