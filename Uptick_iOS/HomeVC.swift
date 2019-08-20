//
//  HomeViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/14/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeVC: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var currentUserData = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
