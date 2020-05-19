//
//  SerializationManager.swift
//  NewsFeedApp
//
//  Created by David Marjanović on 16/05/2020.
//  Copyright © 2020 David Marjanović. All rights reserved.
//

import Foundation

public class SerializationManager{
    
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    public static func parseData<T: Codable>(jsonData: Data) -> T?{
        let object: T?
        do {
            object = try jsonDecoder.decode(T.self, from: jsonData)
        } catch let error {
            debugPrint("Error while parsing data from the server. Received dataClassTyle: \(T.self). More info: \(error)")
            object=nil
        }
        return object
    }
    
}
