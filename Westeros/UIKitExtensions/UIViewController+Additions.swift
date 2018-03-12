//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

// MARK: - Wrap Navigation
extension UIViewController {
    
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}

// MARK: - Notificcation handling
let HOUSE_KEY = "HouseKey"
let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"

extension UIViewController {
    func observeNotificationHouseDidChange(selector: Selector) {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: selector, name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    func removeObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}
