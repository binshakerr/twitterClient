//
//  followerDetailsVC.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/9/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit
import STTwitter
import ARSLineProgress
import NYTPhotoViewer

class followerDetailsVC: UITableViewController, NYTPhotosViewControllerDelegate {
    
    var passedHandle : String!
    var userTweets = [Tweet]()
    var modefiedProfileImageUrl:String?
    var modefiedBannerImageUrl: String?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        
        if currentReachabilityStatus == .notReachable { //Offline
            
            print("OFFLINE")
            alertError(message: "There is no Internet Connection, Please connect and retry later.")
            
        } else { //Online - call api
         
            let st = STTwitterAPI(oAuthConsumerKey: K_consumerKey, consumerSecret: K_consumerSecret, oauthToken: K_accessToken, oauthTokenSecret: K_accessSecret)
            
            st!.verifyCredentials(userSuccessBlock: { (username, userID) in
                
                ARSLineProgress.show()
                
                //Getting Profile Image and cover photo
                st!.getUserInformation(for: self.passedHandle, successBlock: { (info) in
                    
                    let infoDic = info as! [String: Any]
                    let profileImageUrl = infoDic["profile_image_url"] as? String
                    let bannerImageUrl = infoDic["profile_banner_url"] as? String
                    
                    if profileImageUrl != nil && profileImageUrl != "" {
                        self.modefiedProfileImageUrl = profileImageUrl!.replacingOccurrences(of: "_normal", with: "")
                    }
                    
                    if bannerImageUrl != nil && bannerImageUrl != "" {
                        self.modefiedBannerImageUrl = bannerImageUrl!
                    }
                    
                }, errorBlock: { (error) in
                    self.alertError(message: error!.localizedDescription)
                })
                
                
                //Getting Tweets
                st!.getUserTimeline(withScreenName: self.passedHandle, count: 10, successBlock: { (tweets) in
                    
                    let tweetsArray = tweets as! [[String: Any]]
                    
                    for tweet in tweetsArray {
                        
                        print("TWEET: \(tweet)")
                        let entitiesDic = tweet["entities"] as? [String: Any]
                        let mediaArray = entitiesDic?["media"] as? [[String: Any]]
                        let mediaUrl = mediaArray?[0]["media_url_https"] as? String
                        
                        let t = Tweet(time: tweet["created_at"] as! String, content: tweet["text"] as! String, tweetImageURL: mediaUrl, FavCount: tweet["favorite_count"] as! Int, RetweetCount: tweet["retweet_count"] as! Int)
                        
                        self.userTweets.append(t)
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

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return userTweets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "userTopCell", for: indexPath) as! userTopCell
            
            cell.setupCell(profileImageUrl: modefiedProfileImageUrl, bannerImageUrl: modefiedBannerImageUrl)
            
            
            cell.viewProfilePhotoAction = {_ in
                let title = NSAttributedString(string: "Profile Image", attributes: [NSForegroundColorAttributeName: UIColor.white])
                let imageData = UIImageJPEGRepresentation(cell.profileImageView.image!, 1)
                let image = NYTImage(image: cell.profileImageView.image, imageData: imageData, attributedCaptionTitle: title)
                let photosViewController = NYTPhotosViewController(photos: [image])
                photosViewController.delegate = self
                self.present(photosViewController, animated: true, completion: nil)
            }
            
            cell.viewBannerPhotoAction = {_ in
                let title = NSAttributedString(string: "Banner Image", attributes: [NSForegroundColorAttributeName: UIColor.white])
                let imageData = UIImageJPEGRepresentation(cell.backgroundImage.image!, 1)
                let image = NYTImage(image: cell.backgroundImage.image, imageData: imageData, attributedCaptionTitle: title)
                let photosViewController = NYTPhotosViewController(photos: [image])
                photosViewController.delegate = self
                self.present(photosViewController, animated: true, completion: nil)
            }
            
            return cell
        
        } else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! tweetCell
            
            let tweet = userTweets[indexPath.row]
            cell.setupCell(tweet: tweet)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        if indexPath.section == 0 {
            return 200
        }
        
        return 160
    }
 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 200
        }
        
        return UITableViewAutomaticDimension
    }

 

}
