//
//  Response.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 16/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation

public struct Response<T: Codable>: Codable {
    let results: T
}
