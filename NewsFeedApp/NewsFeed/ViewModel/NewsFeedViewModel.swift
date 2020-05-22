//
//  NewsFeedViewModel.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 14/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import RxSwift

class NewsFeedViewModel {
    
    let networkManager = NetworkManager()
    let refreshAndLoaderSubject = PublishSubject<Bool>()
    var disposeBag = DisposeBag()
    
    func createScreenData(data: [NewsList]) -> [NewsListView]{
        var screenData: [NewsListView] = []
        for news in data{
            let newsListView = NewsListView(author: news.author ?? "", title: news.title ?? "", description: news.description ?? "", url: news.url ?? "", urlToImage: news.urlToImage ?? "", publishedAt: news.publishedAt ?? "", content: news.content ?? news.description ?? "", source: news.source!)
            
            screenData.append(newsListView)
        }
        return screenData
    }
    
}
