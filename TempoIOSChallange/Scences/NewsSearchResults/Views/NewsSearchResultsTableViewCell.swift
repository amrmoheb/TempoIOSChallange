//
//  NewsSearchResultsTableViewCell.swift
//  TempoIOSChallange
//
//  Created by Mac on 8/23/21.
//

import UIKit
import Kingfisher
class NewsSearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var ArticleImage: UIImageView!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Description: UITextView!
    @IBOutlet weak var Title: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
       // ArticleImage.image = UIImage(named: "")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func SetArticleTitle(title : String)
    {
        self.Title.text = title
    }
    public func SetArticleDescription(description : String)
    {
        self.Description.text = description
    }
    public func SetArticleDate(date : String)
    {
        self.Date.text = date
    }
    public func SetArticleImage(url : String)
    {
        let url = URL(string: url)
        self.ArticleImage.kf.setImage(with: url)

    }


}
