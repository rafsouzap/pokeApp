//
//  AppDelegate.swift
//  pokeApp
//
//  Created by Rafael de Paula on 11/04/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.prepareRootViewController()
        return true
    }
}

extension AppDelegate {
    
    fileprivate func prepareRootViewController() {
        let controller = PokemonListViewController.storyboardViewController(with: "Main")
        let navigation = NavigationViewController(rootViewController: controller)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
    }
}
