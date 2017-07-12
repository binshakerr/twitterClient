//
//  loginVC.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/7/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit


class loginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                self.performSegue(withIdentifier: "signinToFollowers", sender: nil)
            } else {
                self.alertError(message: error!.localizedDescription)
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    


}
