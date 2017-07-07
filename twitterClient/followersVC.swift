//
//  followersVC.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit

class followersVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
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
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

 


}
