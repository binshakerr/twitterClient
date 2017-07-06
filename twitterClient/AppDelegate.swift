//
//  AppDelegate.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/6/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

       // Twitter.sharedInstance().start(withConsumerKey: "", consumerSecret: "")
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return Twitter.sharedInstance().application(app, open: url, options: options)
        
    }

    
}

