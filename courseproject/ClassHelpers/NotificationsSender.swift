//
//  NotificationsSender.swift
//  courseproject
//
//  Created by Алексей Суровцев on 02.11.2023.
//

import Foundation
import UserNotifications

class NotificationsSender {
    
    static func sendNotification(title: String, message: String) {
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            print(error?.localizedDescription)
        }
    }
    
}
