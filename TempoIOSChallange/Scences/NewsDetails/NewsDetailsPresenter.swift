//
//  NewsDetailsPresenter.swift
//  TempoIOSChallange
//
//  Created by Mac on 8/24/21.
//

import Foundation
class NewsDetailsPresenter {
    weak var view : NewsDetailsPresenterOutput?

    var article : Article?
    
}
extension NewsDetailsPresenter : NewsDetailsPresenterInput
{
    func GetArticleImageURl() -> String {
    return    article?.urlToImage ?? ""
    }
    
    func GetArticleTitle() -> String {
        return    article?.title ?? ""

    }
    
    func GetArticleContent() -> String {
        return    article?.content ?? ""

    }
    
   
    
    func handle() {
        
    }
    func SetArticleData(article : Article?)  {
        self.article = article
    }
    
    
}
