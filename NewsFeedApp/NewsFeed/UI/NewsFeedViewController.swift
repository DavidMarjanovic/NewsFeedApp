//
//  ViewController.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 14/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.

import Foundation
import UIKit
import XLPagerTabStrip

class NewsFeedViewController: UIViewController{

    let pagerTabStrip = PagerViewController()





    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        view.addSubview(pagerTabStrip.view)
        setupConstraints()
    }


    func setupConstraints() {




    }



}

