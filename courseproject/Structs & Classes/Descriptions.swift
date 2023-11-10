//
//  Descriptions.swift
//  courseproject
//
//  Created by Алексей Суровцев on 06.11.2023.
//

import Foundation
import UIKit

class Descriptions {
    static let getter = Descriptions()
    let descriptions: [CategoryType: String] = [
        .mac: "Impressively big. Impossibly thin.",
        .ipad: "Lovable. Drawable. Magical.",
        .iphone: "Love the power. Love the price.",
        .watch: "Smarter. Brighter. Mightier.",
        .vision: "Welcome to the era of spatial computing.",
        .airpods: "Wireless. Effortless. Magical.",
        .tvhome: "The future hits home.",
        .accessories: "Mix. Match. MagSafe."
    ]
    
    let systemImages: [CategoryType: String] = [
        .mac: "macbook.gen2",
        .ipad: "ipad",
        .iphone: "iphone",
        .watch: "applewatch.watchface",
        .vision: "visionpro",
        .airpods: "airpodspro",
        .tvhome: "homepod.and.homepodmini",
        .accessories: "magsafe.batterypack"
    ]
    
    func returnTitle(forKey: CategoryType) -> String {
        return descriptions[forKey]!
    }
    func returnImage(forKey: CategoryType) -> UIImage {
        return UIImage(systemName: systemImages[forKey]!)!
    }
}
