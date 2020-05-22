//
//  NewsListView.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 17/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation

struct NewsListView {
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    let source: Source
    
    init (author: String, title: String, description: String, url: String, urlToImage: String, publishedAt: String, content: String, source: Source) {
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.source = source
    }
}
