//
//  LinesDetailsProtocols.swift
//  zigzagIOSChallange
//
//  Created by Mac on 7/5/21.
//

import Foundation
import  MapKit
protocol NewsSearchResultsPresenterInput {
    func handle(handler : Handle)
    func GetArticlesCount() -> Int
    func GetArticleName(index : Int) -> String
    func GetArticleDescription(index : Int) -> String
    func GetArticleDate(index : Int) -> String
    func GetArticleImageURL(index : Int) -> String
    func GetSelectedArticle() -> Article?
}
protocol NewsSearchResultsPresenterOutput: class {
    func display(display : NewsRsults)
    func display(display : NewsDetails)


}
protocol NewsSearchResultsInteractorInput {
    func perform(performer : GetNewsByQuary)



}
protocol NewsSearchResultsInteractorOutput: class {
    func present(presenter : NewsSearchResponse)


}
