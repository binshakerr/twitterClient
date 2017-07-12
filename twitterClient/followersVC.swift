//
//  followersVC.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit
import STTwitter
import ARSLineProgress
import RealmSwift

class followersVC: UITableViewController {
    
    var followers = [Follower]()
    var passedHandle: String?
    var passedFullName: String?
    
    let realm = try! Realm()
    var savedFollowers : Results<SavedFollower>{
        get {
            return realm.objects(SavedFollower.self)
        }
    }
    
    //removing all
//    let realm = try! Realm()
//    try! realm.write {
//        realm.deleteAll()
//    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
       
        if currentReachabilityStatus == .reachableViaWiFi {
            print("wifi")
        }
        
        if currentReachabilityStatus == .reachableViaWWAN {
            print("cellular")
        }
        
        if currentReachabilityStatus == .notReachable { //Offline - load the coreData
            
            print("OFFLINE")
            alertError(message: "There is no Internet Connection, Please connect and retry later.")
            
            // load the core date
            
        } else { //Online - call api
            
            
            let st = STTwitterAPI(oAuthConsumerKey: K_consumerKey, consumerSecret: K_consumerSecret, oauthToken: K_accessToken, oauthTokenSecret: K_accessSecret)
            
            st!.verifyCredentials(userSuccessBlock: { (username, userID) in
                
                ARSLineProgress.show()
                
                st!.getFollowersForScreenName(username, successBlock: { (followers) in
                    
                    let followersArray = followers as! [[String: Any]]
                    
                    for follower in followersArray {
                        
                        let f = Follower(fullName: follower["name"] as! String, handle: follower["screen_name"] as! String, profileImageURL: follower["profile_image_url"] as! String, bio: follower["description"] as? String)
                        
                        self.followers.append(f)
                        
//                        //save to realm
//                        let sf = SavedFollower()
//                        sf.fullName = f.fullName
//                        sf.handle = f.handle
//                        sf.profileImageURL = f.profileImageURL
//                        sf.handle = f.handle
//                        
//                        do {
//                            try self.realm.write {
//                                self.realm.add(sf)
//                            }
//                        } catch {
//                            self.alertError(message: error.localizedDescription)
//                        }
                        
                    }
                    
                    DispatchQueue.main.async {
                        ARSLineProgress.hide()
                        self.tableView.reloadData()
                    }
                    
                }, errorBlock: { (error) in
                    ARSLineProgress.hide()
                    self.alertError(message: error!.localizedDescription)
                })
                
            }, errorBlock: { (error) in
                ARSLineProgress.hide()
                self.alertError(message: error!.localizedDescription)
            })
            
        }
        
  
        
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
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        passedHandle = followers[indexPath.row].handle
        passedFullName = followers[indexPath.row].fullName
        performSegue(withIdentifier: "followersToFollowerDetails", sender: nil)
    }
    
    
    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "followersToFollowerDetails" {
            let vc = segue.destination as! followerDetailsVC
            vc.title = passedFullName!
            vc.passedHandle = passedHandle!
        }
    }

 


}
