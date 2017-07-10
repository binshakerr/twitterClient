//
//  tweetCell.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/9/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit
import Kingfisher

class tweetCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var tweetImage: UIImageView!
    
    @IBOutlet weak var tweetImageHeight: NSLayoutConstraint!
    @IBOutlet weak var favLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    
    func setupCell(tweet: Tweet) {
        
        contentLabel.text = tweet.content
        
        if tweet.tweetImageURL != nil && tweet.tweetImageURL != "" {
            
            tweetImageHeight.constant = 200
            let url = URL(string: tweet.tweetImageURL!)
            tweetImage.kf.setImage(with: url)
        } else {
            tweetImageHeight.constant = 0
        }
        
        timeLabel.text = convertDateString(DateString: tweet.time)
        favLabel.text = "\(tweet.FavCount) Favs"
        retweetLabel.text = "\(tweet.RetweetCount) Retweets"
    }
    
    
    
    func convertDateString(DateString: String) -> String {
        
        // create dateFormatter with UTC time format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "eee MMM dd HH:mm:ss ZZZZ yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let date = dateFormatter.date(from: DateString)
        
        //get the difference between tweet date and current date
        let from = date
        let to = Date()
        let components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .weekOfMonth, .month], from: from!, to: to)
        
        //format the diffence in readable format
        if components.second! > 0 && components.minute! == 0 {
            return "\(components.second!) seconds ago"
        } else if components.minute! > 0 && components.hour! == 0 {
            return "\(components.minute!) minutes ago"
        } else if components.hour! > 0 && components.day! == 0 {
            return "\(components.hour!) hours ago"
        } else if components.day! > 0 && components.weekOfMonth! == 0 {
            return "\(components.day!) days ago"
        } else if components.weekOfMonth! > 0 && components.month! == 0 {
            return "\(components.weekOfMonth!) weeks ago"
        }
     
        return ""
    }
    
    
}
