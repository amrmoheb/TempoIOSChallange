//
//  LinesDetailsViewController.swift
//  zigzagIOSChallange
//
//  Created by Mac on 7/5/21.
//

import UIKit
import MapKit
class NewsSearchResultsViewController: UIViewController {
    var presenter : LinesDetailsPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let  MainPresenter = LinesDetailsPresenter()
        let MainInteractor = LinesDetailsInteractor()
        MainPresenter.view = self
        MainPresenter.interactor = MainInteractor
        MainInteractor.presenter = MainPresenter
        presenter = MainPresenter
    
        // Do any additional setup after loading the view.
        
    }
    

}
extension NewsSearchResultsViewController : LinesDetailsPresenterOutput{
    func display(draw : Draw) {
        DrawLines()
    }
    
  
}
extension NewsSearchResultsViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell  = tableView.dequeueReusableCell(withIdentifier: "LineCell") as! LineTableViewCell
     
        return cell
    }
}

