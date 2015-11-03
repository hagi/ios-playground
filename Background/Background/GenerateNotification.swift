//
//  GenerateNotification.swift
//  Background
//
//  Created by hagi on 03/11/15.
//  Copyright (c) 2015 hagi.io. All rights reserved.
//

import Foundation
import UIKit

class GenerateNotification {
    
    required init() {}
    
    func call(value: Double) {
        let notification = generateNotification(value)
        scheduleNotification(notification)
    }

    private func generateNotification(value: Double) -> UILocalNotification {
        let notification = UILocalNotification()
        notification.fireDate = NSDate()
        notification.alertBody = "Current course: \(value)"
        return notification
    }
    
    private func scheduleNotification(notification: UILocalNotification) {
        let application = UIApplication.sharedApplication()
        // application.cancelAllLocalNotifications()
        application.scheduleLocalNotification(notification)
    }
    
    static func call(value: Double) {
        self().call(value)
    }
}