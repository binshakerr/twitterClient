//
//  NYTImage.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/11/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import NYTPhotoViewer

class NYTImage: NSObject, NYTPhoto {
    
    var image: UIImage?
    var imageData: Data?
    var placeholderImage: UIImage?
    let attributedCaptionTitle: NSAttributedString?
    let attributedCaptionSummary: NSAttributedString? = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName: UIColor.gray])
    let attributedCaptionCredit: NSAttributedString? = NSAttributedString(string: "", attributes: [NSForegroundColorAttributeName: UIColor.darkGray])
    
    init(image: UIImage? = nil, imageData: Data? = nil, attributedCaptionTitle: NSAttributedString) {
        self.image = image
        self.imageData = imageData
        self.attributedCaptionTitle = attributedCaptionTitle
        super.init()
    }
    
}
