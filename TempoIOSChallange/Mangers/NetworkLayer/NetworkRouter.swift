//
//  File.swift
//  MREC
//
//  Created by developer on 06/05/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation

enum NetworkRouter
{  static let baseURLString = "https://newsapi.org"
    static let APIKey = "ce01058e44ac49409138aee1fc2c79b4"
    
    case GetNewsResults(String)
    func GetUrl() -> String {
        var relativePath = ""
        switch self {
        
        case .GetNewsResults(let SearchQuary):
            relativePath =  "/v2/everything?q=" + String (SearchQuary) + "&from=2021-07-23&sortBy=publishedAt&apiKey=" + String(NetworkRouter.APIKey)
      
        }
        return NetworkRouter.baseURLString + relativePath
    }
    func GetMethod() -> String {
        switch self {

        case .GetNewsResults:
            return "GET"
        }
    }


  
    
}
