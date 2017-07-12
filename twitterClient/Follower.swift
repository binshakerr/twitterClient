//
//  Follower.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import Foundation
import RealmSwift

struct Follower {
    
    var fullName: String!
    var handle: String!
    var profileImageURL: String!
    var bio: String?
    
    init (fullName: String, handle: String, profileImageURL:String, bio: String?) {
        self.fullName = fullName
        self.handle = handle
        self.profileImageURL = profileImageURL
        self.bio = bio
    }

}


class SavedFollower : Object {
    
    dynamic var fullName = ""
    dynamic var handle = ""
    dynamic var profileImageURL = ""
    dynamic var bio = ""
}
