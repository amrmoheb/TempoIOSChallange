//
//  LinesDetailsViewController.swift
//  zigzagIOSChallange
//
//  Created by Mac on 7/5/21.
//

import UIKit
import MapKit
class NewsSearchResultsViewController: UIViewController {
    var presenter : NewsSearchResultsPresenterInput!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var SearchResultsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let  MainPresenter = NewsSearchResultsPresenter()
        let MainInteractor = NewsSearchResultsInteractor()
        MainPresenter.view = self
        MainPresenter.interactor = MainInteractor
        MainInteractor.presenter = MainPresenter
        presenter = MainPresenter



        SearchBar.delegate = self

    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewsDetails" {
           if let nextViewController = segue.destination as? NewsDetailsViewController {
            nextViewController.article = presenter.GetSelectedArticle()//Or pass any values
            }
        }
    }
}

extension NewsSearchResultsViewController : NewsSearchResultsPresenterOutput{
    func display(display: NewsDetails) {
        self.performSegue(withIdentifier: "NewsDetails", sender: self)

    }
    
    func display(display : NewsRsults) {
        SearchResultsTableView.reloadData()
    }
    
  
}
extension NewsSearchResultsViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.GetArticlesCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "NewsSearchResultsCell") as! NewsSearchResultsTableViewCell

        cell.SetArticleTitle(title: presenter.GetArticleName(index: indexPath.row))
        cell.SetArticleDescription(description: presenter.GetArticleDescription(index: indexPath.row))
        cell.SetArticleDate(date: presenter.GetArticleDate(index: indexPath.row))
        cell.SetArticleImage(url: presenter.GetArticleImageURL(index: indexPath.row))
        return cell
    }
   public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
    presenter.handle(handler : Handle.ArticleSelected(indexPath.row))

    }
}

extension NewsSearchResultsViewController : UISearchBarDelegate
{

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText \(searchBar.text)")
    presenter.handle(handler: Handle.NewSearchQuary(searchBar.text ?? ""))
    }
    
}
