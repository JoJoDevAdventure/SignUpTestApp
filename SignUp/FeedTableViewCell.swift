//
//  FeedTableViewCell.swift
//  SignUp
//
//  Created by Youssef Bhl on 17/11/2021.


import UIKit

class FeedTableViewCell: UITableViewCell {
    
    //Mark : Outlets
    
    @IBOutlet weak var UserProfileIMG: UIImageView!
    @IBOutlet weak var FeedIMG: UIImageView!
    @IBOutlet weak var FeedUserNameLabel: UILabel!
    @IBOutlet weak var FeedLikesNumberLabel: UILabel!
    
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var BottomView: UIView!
    
    @IBOutlet weak var LikeButton: UIButton!
    
    //Mark: Action
    
    @IBAction func Liked(_ sender: Any) {
        
    }
    
    
    //Mark : var & Const
    
    static let identifier = "FeedTableViewCell"

    
    //Mark : Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FeedTableViewCell", bundle: nil)
    }
    
    func configure(with model: ChillaxPost){
        
        self.FeedLikesNumberLabel.text = "\(model.FeedNumberOfLikes) Likes"
        self.FeedUserNameLabel.text = (model.FeedUserName)
        self.UserProfileIMG.image = UIImage(named: model.UserProfileIMGName)
        self.FeedIMG.image = UIImage(named: model.FeedIMGName)
        
    }
    
}
