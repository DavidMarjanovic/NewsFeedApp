//
//  NewsList.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 16/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation

struct NewsList: Codable{
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable{
    let id: String?
    let name: String?
}
