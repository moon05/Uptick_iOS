//
//  ProjectViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/14/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileVC: UIViewController {
    
    var currentUserData = User()
    
    
    //profile basic info outlets
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var classYearLabel: UILabel!
    @IBOutlet var dormLabel: UILabel!
    @IBOutlet var mobileLabel: UILabel!
    
    //account history outlets
    //the following should take to isolated view controllers
    @IBOutlet var prevOrdersButton: UIButton!
    @IBOutlet var itemsForSaleButton: UIButton!
    
    
    //profile statistic info outlets
    @IBOutlet var itemsBoughtButton: UIButton!
    @IBOutlet var moneySavedButton: UIButton!
    @IBOutlet var moneyMadeButton: UIButton!
    
    //seller review info outlets
    @IBOutlet var starsButton: UIButton!
    @IBOutlet var numReviewsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Printing Current User Data")
        
        checkIfLoggedIn()
        
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Available Users", style: .plain, target: self, action: #selector(handleNewMessage))
//        nameLabel.text = currentUserData.firstname
//        mobileLabel.text = currentUserData.phone
        
        // Do any additional setup after loading the view.
    }
    
    
//    @objc func handleNewMessage() {
//        let allUserController  = AllUserVC()
//        let navController = UINavigationController(rootViewController: allUserController)
//        present(navController, animated: true, completion: nil)
//    }
    
    func checkIfLoggedIn() {
        if Auth.auth().currentUser == nil {
            perform(#selector(handleLogOut), with: nil, afterDelay: 0)
        } else {
            
            guard let uid = Auth.auth().currentUser?.uid else {
                return
            }
            let ref = Database.database().reference(fromURL: "https://uptickmarketplace-f31e9.firebaseio.com/")
            let userReference = ref.child("users").child(uid)
            userReference.observeSingleEvent(of: .value,
            with: {(snapshot) in
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.currentUserData.firstname = dictionary["firstname"] as? String
                    self.currentUserData.lastname = dictionary["lastname"] as? String
                    self.currentUserData.dorm = dictionary["dorm"] as? String
                    self.currentUserData.school = dictionary["school"] as? String
                    self.currentUserData.email = dictionary["email"] as? String
                    self.currentUserData.phone = dictionary["phone"] as? String
                   
                    self.fieldValueSetting(userData: self.currentUserData)
                }
            }, withCancel: nil)
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
    
    func fieldValueSetting(userData: User){
        nameLabel.text = userData.firstname
        schoolLabel.text = userData.school
        classYearLabel.text = "Class of to be filled"
        dormLabel.text = userData.dorm
        mobileLabel.text = userData.phone
    }
    
    
}
