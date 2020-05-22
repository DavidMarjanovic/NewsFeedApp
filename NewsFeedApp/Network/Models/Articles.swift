//
//  Articles.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 21/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation

struct Articles<T: Codable>: Codable{
    let articles: T
}
