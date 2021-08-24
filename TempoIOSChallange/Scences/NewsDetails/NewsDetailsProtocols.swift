//
//  NewsDetailsProtocols.swift
//  TempoIOSChallange
//
//  Created by Mac on 8/24/21.
//

import Foundation
protocol NewsDetailsPresenterInput {
    func handle()
    func SetArticleData(article : Article?)
    func GetArticleImageURl() -> String
    func GetArticleTitle() -> String
    func GetArticleContent() -> String


   
}
protocol NewsDetailsPresenterOutput: class {
    func display()



}
