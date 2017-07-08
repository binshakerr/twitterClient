//
//  followersVC.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import STTwitter

class followersVC: UITableViewController {
    
    var followers = [Follower]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let st = STTwitterAPI(oAuthConsumerKey: K_consumerKey, consumerSecret: K_consumerSecret, oauthToken: K_accessToken, oauthTokenSecret: K_accessSecret)
        
        st!.verifyCredentials(userSuccessBlock: { (username, userID) in
            
            st!.getFollowersForScreenName(username, successBlock: { (followers) in
                
                let followersArray = followers as! [[String: Any]]
                
                for follower in followersArray {
                    
                    let f = Follower(fullName: follower["name"] as! String, handle: follower["screen_name"] as! String, profileImageURL: follower["profile_image_url"] as! String, bio: follower["description"] as? String)
 
                    self.followers.append(f)
                }
                
                self.tableView.reloadData()
                
            }, errorBlock: { (error) in
                print(error!.localizedDescription)
            })
            
        }, errorBlock: { (error) in
            print(error!.localizedDescription)
        })
        
    }
    
    

    @IBAction func logoutBtnPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Sign out", message: "Are you sure you want to sign out?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .destructive) {_ in
            
            let store = Twitter.sharedInstance().sessionStore
            if let userID = store.session()?.userID {
                store.logOutUserID(userID)
                print("user is logged out")
                let vc = K_mainStoryboard.instantiateViewController(withIdentifier: "loginVC")
                K_appDelegate.window?.rootViewController = vc
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
  

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return followers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "followerCell", for: indexPath) as! followerCell

        let follower = followers[indexPath.row]
        cell.setupCell(follower: follower)

        return cell
    }
    

 


}
