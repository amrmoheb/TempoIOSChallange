//
//  LinesDetailsPresenter.swift
//  zigzagIOSChallange
//
//  Created by Mac on 7/5/21.
//

import Foundation
import MapKit
class NewsSearchResultsPresenter {
    var selectedArticleIndex = 0
    
    var interactor: NewsSearchResultsInteractorInput!
   weak var view : NewsSearchResultsPresenterOutput?
    var articles : [Article]? {
        didSet {
            view?.display(display: NewsRsults())
        }
    }
}



extension NewsSearchResultsPresenter: NewsSearchResultsInteractorOutput
{
    func present(presenter  : NewsSearchResponse)
    {
     articles =   presenter.articles
    }

}

extension NewsSearchResultsPresenter: NewsSearchResultsPresenterInput
{
    func GetArticleDescription(index: Int) -> String {
        return   articles?[index].articleDescription ?? "No Discription"

    }
    
    func GetArticleDate(index: Int) -> String {
        return   articles?[index].publishedAt ?? ""

    }
    
    func GetArticlesCount() -> Int {
      return  articles?.count ?? 0
    }
    
    func GetArticleName(index : Int) -> String {
     return   articles?[index].title ?? "No title"
    }
    func GetArticleImageURL(index : Int) -> String {
     return   articles?[index].urlToImage ?? ""
    }
    func GetSelectedArticle() -> Article? {
        return   articles?[selectedArticleIndex] 
    }
   
    
    func handle(handler : Handle)
    {
        print("handle view task in presenter")
        switch handler {
        case .NewSearchQuary(let quary):
            print(quary)
            var request = GetNewsByQuary()
            request.quary = quary
            interactor.perform(performer: request)
            
        case .ArticleSelected(let index):
        self.selectedArticleIndex = index
            view?.display(display: NewsDetails())
        }
    }
  
   
}
