//
//  LinesDetailsInteractor.swift
//  zigzagIOSChallange
//
//  Created by Mac on 7/5/21.
//

import Foundation
class NewsSearchResultsInteractor
{
    var networkManger = NetworkLayer()

   weak var presenter : NewsSearchResultsInteractorOutput?
    
}
extension NewsSearchResultsInteractor : NewsSearchResultsInteractorInput
{

    
    
    func perform(performer : GetNewsByQuary) {
   
        networkManger.GetRequest(Model: NewsSearchResponse.self, RequestConfiq: NetworkRouter.GetNewsResults(performer.quary ?? ""), completionHandler:   {
           respose,State in
                     //    print(respose)
           switch State
            {
           case .empty:
            print("No Data Found")
              
            return
           case .error(let error):
            print(error)
            return
           case .Success:
            print("Success")
         if  let results = respose as? NewsSearchResponse
         {
            self.presenter?.present(presenter: results)
         }

           }
            
    })
        }

    
}
