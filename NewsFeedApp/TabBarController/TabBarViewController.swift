//
//  TabBarViewController.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 14/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//
import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let firstViewController = NewsFeedViewController()
        let firstNavigationController = UINavigationController()
        firstNavigationController.tabBarItem = UITabBarItem(title: "News Feed", image: .actions, tag: 0)
        
        let secondViewController = FavoriteNewsViewController()
        let secondNavigationController = UINavigationController()
        secondNavigationController.tabBarItem = UITabBarItem(title: "Favorite News", image: .checkmark, tag: 1)
        
        let tabBarList = [firstNavigationController, secondNavigationController]
        firstNavigationController.pushViewController(firstViewController, animated: true)
        secondNavigationController.pushViewController(secondViewController, animated: true)
        viewControllers = tabBarList
    }
    
}
