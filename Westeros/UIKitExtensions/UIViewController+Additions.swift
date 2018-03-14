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
    // No me gusta que se continúe mostrando la vista si seleccionamos otra casa....
    @objc func houseDidChangeNotificationHandler() {
        navigationController?.popViewController(animated: true)
    }
    
    func sendHouseChangeNotification(house: House) {
        let notificationCenter = NotificationCenter.default
        
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY : house])
        
        notificationCenter.post(notification)
    }
    
    func observeNotificationHouseDidChange() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChangeNotificationHandler), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
        
    }
    
    func removeObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
}
