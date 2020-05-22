//
//  NewsCellItems.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 21/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit

enum NewsCellType{
    case image
    case title
    case author
    case time
    case description
    case link
    case source
}

struct NewsCellItem{
    let type: NewsCellType
    let data: Any
}


