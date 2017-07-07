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

        Twitter.sharedInstance().start(withConsumerKey: K_consumerKey, consumerSecret: K_consumerSecret)
        
        
        if Twitter.sharedInstance().sessionStore.session() != nil {
            
            print("there is a saved user")
            
            let vc = K_mainStoryboard.instantiateViewController(withIdentifier: "followersNav")
            window?.rootViewController = vc
            
        } else {
            
            print("new account")
        
            let vc = K_mainStoryboard.instantiateViewController(withIdentifier: "loginVC")
            window?.rootViewController = vc
        }
        
        setupNavigationBars()
        
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return Twitter.sharedInstance().application(app, open: url, options: options)
        
    }
    
    
    func setupNavigationBars() {
        
        UINavigationBar.appearance().tintColor = .white //color of navigation back
        UINavigationBar.appearance().barTintColor = UIColor(red: 0/255.0, green: 172/255.0, blue: 237/255.0, alpha: 1.0) //background color
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white] //color of title
        UINavigationBar.appearance().isTranslucent = false //non transparent
    }

    
}

