//
//  followerCell.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit
import Kingfisher


class followerCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!

 
    
    func setupCell(follower: Follower){
        
        fullNameLabel.text = follower.fullName
        handleLabel.text = follower.handle
        
        let url = URL(string: follower.profileImageURL)
        profileImageView.kf.setImage(with: url)
        
       // if follower.bio != nil {
            bioLabel.text = follower.bio
       // }
    }

  

}
