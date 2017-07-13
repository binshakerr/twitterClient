//
//  Follower.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import Foundation
import RealmSwift


class Follower : Object {
    
    dynamic var fullName = ""
    dynamic var handle = ""
    dynamic var profileImageURL = ""
    dynamic var bio = "" //: String?
    
//    //primary key for updating object
//    override static func primaryKey() -> String? {
//        return "handle"
//    }
}



