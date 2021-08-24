//
//  NewsDetailsViewController.swift
//  TempoIOSChallange
//
//  Created by Mac on 8/24/21.
//

import UIKit
import Kingfisher
class NewsDetailsViewController: UIViewController {
    public var article : Article?
    var presenter : NewsDetailsPresenterInput!

    @IBOutlet weak var ArticleTitle: UILabel!
    @IBOutlet weak var ArticleImage: UIImageView!
    
    @IBOutlet weak var ArticleContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(article?.title)
        let  MainPresenter = NewsDetailsPresenter()
        MainPresenter.view = self
        presenter = MainPresenter
        presenter.SetArticleData(article: article)
        SetupDetailesView()
        // Do any additional setup after loading the view.
    }
    
    func SetupDetailesView()  {
        ArticleTitle.text = presenter.GetArticleTitle()
        let url = URL(string: presenter.GetArticleImageURl())
        self.ArticleImage.kf.setImage(with: url)
        ArticleContent.text = presenter.GetArticleContent()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewsDetailsViewController : NewsDetailsPresenterOutput
{
    func display() {
        
    }
    
    
}
