//
//  AppDelegate.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 14/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let initialViewController = UINavigationController(rootViewController: TabBarViewController())
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = initialViewController
        return true
        
    }
    
}

