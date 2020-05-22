//
//  NetworkManager.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 16/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager {
    let apiKey = "82bed1ed936b42a697f0ce0050576dfa"
    
    func getData(from url: String,_ completed: @escaping([NewsList]?, String?) -> Void){
        AF.request(url + apiKey).validate().responseDecodable(of: Articles<[NewsList]>.self, decoder: SerializationManager.jsonDecoder) { (newsResponse) in
            switch newsResponse.result {
            case .success(let newsResponse):
                completed(newsResponse.articles, nil)
            case .failure(let error):
                debugPrint("Error happened", error)
                completed(nil, error.errorDescription)
            }
        }
    }
}
