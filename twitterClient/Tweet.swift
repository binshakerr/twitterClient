//
//  Tweet.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/9/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import Foundation

struct Tweet {
    
    var time: String!
    var content: String!
    var tweetImageURL: String?
    var FavCount = 0
    var RetweetCount = 0
    
    init (time: String, content: String, tweetImageURL:String?, FavCount: Int, RetweetCount: Int) {
        self.time = time
        self.content = content
        self.tweetImageURL = tweetImageURL
        self.FavCount = FavCount
        self.RetweetCount = RetweetCount
    }
}
