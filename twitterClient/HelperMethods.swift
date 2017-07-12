//
//  HelperMethods.swift
//  twitterClient
//
//  Created by Eslam Shaker on 7/11/17.
//  Copyright © 2017 Eslam Shaker. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func alertError(message: String) {
     
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
