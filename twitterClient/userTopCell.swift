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
    
    var viewProfilePhotoAction : ((UITableViewCell) -> Void)?
    var viewBannerPhotoAction : ((UITableViewCell) -> Void)?

    
    override func awakeFromNib() {
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 5
        
        let viewProfilePhotoTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewProfilephoto))
        self.profileImageView.addGestureRecognizer(viewProfilePhotoTapGesture)

        let viewBannerPhotoTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.viewBannerphoto))
        self.backgroundImage.addGestureRecognizer(viewBannerPhotoTapGesture)

    }
    
    func viewProfilephoto(sender: UITapGestureRecognizer) {
        viewProfilePhotoAction?(self)
    }
    
    func viewBannerphoto(sender: UITapGestureRecognizer) {
        viewBannerPhotoAction?(self)
    }
    
    
    func setupCell(profileImageUrl: String?, bannerImageUrl: String? ){
        
        if profileImageUrl != nil && profileImageUrl != "" {
            let url = URL(string: profileImageUrl!)
            profileImageView.kf.setImage(with: url)
        } else {
            profileImageView.image = UIImage(named: "defaultProfile")
        }
        
        if bannerImageUrl != nil && bannerImageUrl != "" {
            let url = URL(string: bannerImageUrl!)
            backgroundImage.kf.setImage(with: url)
        } else {
            backgroundImage.image = UIImage(named: "defaultBanner")
        }
    }
    

}
