//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 08/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var houseDetailViewController: HouseDetailViewController!
    var seasonDetailViewController: SeasonDetailViewController!
    var splitViewController: UISplitViewController!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()
        
        
        // Crear el modelo
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons

        // Creamos los controladores (masterVC, detailVC)
        let houseListViewController = HouseListViewController(model: houses)
        let seasonListViewController = SeasonListViewController(model: seasons)
        
        let masterTabBarController = UITabBarController()
        masterTabBarController.viewControllers = [houseListViewController.wrappedInNavigation(), seasonListViewController.wrappedInNavigation()]
        
        let lastSelectedHouse = houseListViewController.lastSelectedHouse()
        houseDetailViewController = HouseDetailViewController(model: lastSelectedHouse)
        
        seasonDetailViewController = SeasonDetailViewController(model: seasons.first!)
        
        
        // Asignar delegados
        houseListViewController.delegate = houseDetailViewController
        seasonListViewController.delegate = seasonDetailViewController
        masterTabBarController.delegate = self
        
        // Crear el UISplitVC y le asignamos los viewControllers (master y detail)
        splitViewController = UISplitViewController()
        splitViewController.viewControllers = [
            masterTabBarController, houseDetailViewController.wrappedInNavigation(), seasonDetailViewController.wrappedInNavigation()
        ]
        
        // Asignamos el rootVC
        window?.rootViewController = splitViewController
        
        return true
    }
}


extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            if tabBarController.selectedIndex == 0 {
                splitViewController.showDetailViewController(houseDetailViewController.wrappedInNavigation(), sender: nil)
            } else {
                splitViewController.showDetailViewController(seasonDetailViewController.wrappedInNavigation(), sender: nil)
            }
        }
    }
}

