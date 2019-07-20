//
//  SettingsViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/19/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    @IBOutlet var locationServicesButton: UIButton!
    @IBOutlet var notificationSettingsButton: UIButton!
    @IBOutlet var helpButton: UIButton!
    @IBOutlet var reportIssueButton: UIButton!
    @IBOutlet var deleteAccountButton: UIButton!
    
    @IBAction func deleteAccountAction(sender: AnyObject){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
}
