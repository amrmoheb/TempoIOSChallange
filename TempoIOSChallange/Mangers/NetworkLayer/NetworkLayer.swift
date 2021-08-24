//
//  NetworkLayer.swift
//  MREC
//
//  Created by developer on 07/05/2020.
//  Copyright © 2020 developer. All rights reserved.
//

import Foundation
import Alamofire
class NetworkLayer {
    
    
       var AnyModel :Any!
    typealias CompletionHandler = (Any,State) -> Void
    init() {
        
    }
    //swicher
    func Request<T>( ResponseModel: T.Type,RequestConfiq: NetworkRouter,completionHandler: @escaping  CompletionHandler) where T: Decodable
    {
        switch RequestConfiq.GetMethod() {
      
      case "Get":
             GetRequest(Model: ResponseModel, RequestConfiq: RequestConfiq, completionHandler: completionHandler)
              print("Get Request Proceed")
  
        default:
            print("No Method setted")
        }
    }
    public  func GetRequest<T:Decodable>( Model: T.Type,RequestConfiq: NetworkRouter,completionHandler: @escaping  CompletionHandler)
      {
        print(RequestConfiq.GetUrl())
  
        let request = AF.request(RequestConfiq.GetUrl())
       // var utf8Text = ""
        
       request.responseJSON
        {
            data  in
         
            print(RequestConfiq.GetUrl())
            print("mydata")
            print(data)
                print(Model)
          
            switch data.result {
            case .failure(let error):
             // self.NetworkErrorHandle(ErrorMessage :" Check your Internet Connection ")
               print(error)
                completionHandler(self.AnyModel,.error("cant connect to server"))
              return
                // Do your code here...

            case .success(_):
                print("Success")
                if data.data == nil
                          {
                              print("NoData")
                           completionHandler(self.AnyModel,.empty)
                            return
                          }
            }
        //self.AnyModel =  try! JSONDecoder().decode(NewsSearchResponse.self, from: data.data!)


            do{
            //    print(<#T##items: Any...##Any#>)
                self.AnyModel =  try  JSONDecoder().decode(Model.self, from: data.data!)


           }


           catch{


               print("error in parsssssing")
            completionHandler(self.AnyModel,.error("error in parsssssing"))

           }
           
        //    MinValue = self.Intro.MinYesToPass!
        //print(self.Intro.MinYesToPass)
            completionHandler(self.AnyModel,.Success)
      }
     
     //   return MinValue
    }
    
    

}
