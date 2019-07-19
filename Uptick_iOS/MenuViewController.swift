//
//  MenuViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/19/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MenuViewController: UIViewController {
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var faqButton: UIButton!
    @IBOutlet var termsButton: UIButton!
    @IBOutlet var contactButton: UIButton!
    @IBOutlet var notificationsButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    

    @IBAction func logoutAction(sender:AnyObject) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.performSegue(withIdentifier: "LogoutApp", sender: self)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
