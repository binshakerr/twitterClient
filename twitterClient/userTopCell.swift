//
//  userTopCell.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/9/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit
import Kingfisher

class userTopCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func awakeFromNib() {
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 5
    }
    
    
    func setupCell(profileImageUrl: String?, bannerImageUrl: String? ){
        
        if profileImageUrl != nil && profileImageUrl != "" {
            let url = URL(string: profileImageUrl!)
            profileImageView.kf.setImage(with: url)
        } else {
            //setup default profile image
        }
        
        if bannerImageUrl != nil && bannerImageUrl != "" {
            let url = URL(string: bannerImageUrl!)
            backgroundImage.kf.setImage(with: url)
        } else {
            //setup default background
        }
    }
    

}
