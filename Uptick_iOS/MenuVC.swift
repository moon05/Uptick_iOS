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

class MenuVC: UIViewController {
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var faqButton: UIButton!
    @IBOutlet var termsButton: UIButton!
    @IBOutlet var contactButton: UIButton!
    @IBOutlet var notificationsButton: UIButton!
    @IBOutlet var settingsButton: UIButton!
    @IBOutlet var logoutButton: UIButton!
    
    var currentUserData = User()
    

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
        checkIfLoggedIn()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    
    func checkIfLoggedIn() {
        if Auth.auth().currentUser == nil {
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
            
        }
    }
    
    @objc func handleLogOut() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let signinController = SignInVC()
        present(signinController, animated: true, completion: nil)
    }
    
}
