//
//  ViewController.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 14/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.

import Foundation
import UIKit
import XLPagerTabStrip
import SnapKit

class NewsFeedViewController: UIViewController{
    
    let pagerTabStrip = PagerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pagerTabStrip.view)
        self.addChild(pagerTabStrip)
        pagerTabStrip.didMove(toParent: self)
        setupConstraints()
    }
    
    func setupConstraints() {
        pagerTabStrip.view.snp.makeConstraints { (maker) in
            maker.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

