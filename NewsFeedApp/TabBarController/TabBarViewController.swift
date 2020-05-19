//
//  TabBarViewController.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 14/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstViewController = NewsFeedViewController()
                
        firstViewController.tabBarItem = UITabBarItem(title: "News Feed", image: .actions, tag: 0)

        let secondViewController = FavoriteNewsViewController()

        secondViewController.tabBarItem = UITabBarItem(title: "Favorite News", image: .checkmark, tag: 1)

        let tabBarList = [firstViewController, secondViewController]

        viewControllers = tabBarList
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
