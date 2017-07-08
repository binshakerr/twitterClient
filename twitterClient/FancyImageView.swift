//
//  FancyImageView.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit

class FancyImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width/2
    }
    
    
}
