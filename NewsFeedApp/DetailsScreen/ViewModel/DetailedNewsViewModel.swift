//
//  DetailedNewsViewModel.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 22/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit

class DetailedNewsViewModel {
    
    func createScreenData(news: NewsListView) -> [NewsCellItem] {
        var screenData: [NewsCellItem] = []
        screenData.append(NewsCellItem(type: .image, data: news.urlToImage))
        screenData.append(NewsCellItem(type: .author, data: news.author))
        screenData.append(NewsCellItem(type: .description, data: news.content))
        screenData.append(NewsCellItem(type: .source, data: news.source.name as Any))
        screenData.append(NewsCellItem(type: .title, data: news.title))
        screenData.append(NewsCellItem(type: .link, data: news.url))
        screenData.append(NewsCellItem(type: .time, data: news.publishedAt))
        return screenData
    }
    
}
