//
//  PagerTabStripController.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 14/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip
import SnapKit


class PagerViewController: ButtonBarPagerTabStripViewController {
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        settings.style.buttonBarBackgroundColor = .white
////        settings.style.buttonBarItemBackgroundColor = .white
////        settings.style.selectedBarBackgroundColor = .blue
////        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
////        settings.style.selectedBarHeight = 1.0
////        settings.style.buttonBarMinimumLineSpacing = 0
////        settings.style.buttonBarItemTitleColor = .black
////        settings.style.buttonBarItemsShouldFillAvailableWidth = true
////        settings.style.buttonBarLeftContentInset = 0
////        settings.style.buttonBarRightContentInset = 0
////
////
////        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
////            guard changeCurrentIndex == true else {return}
////            oldCell?.label.textColor = .black
////            newCell?.label.textColor = .blue
//
//        }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        
        let child1 = ChildViewControllers(source: "bbc-news")
        child1.childNumber = "one"
        let child2 = ChildViewControllers(source: "abc-news")
        child2.childNumber = "two"
        return [child1, child2]
        
        
        }
    

    
    
    
    
    
}
