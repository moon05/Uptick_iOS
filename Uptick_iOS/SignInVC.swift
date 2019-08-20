//
//  ViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/14/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import SwiftKeychainWrapper

class SignInVC: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    let currentUserData = User()
    
    var schoolPickerData: [String] = [String]()
    var allDormData: [String: [String]] = [String: [String]]()
    var selectedDormData: [String] = [String]()
    
    
    
    @IBAction func loginAccount(sender:AnyObject) {
        if self.emailField.text == "" || self.passwordField.text == "" {
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields
            showAlert()
        } else {
            handleLogin()
        }
    }
    
    

    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerViewDataGather()


    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func handleLogin() {
        guard let email = emailField.text, let password = passwordField.text else {
            print ("Not valid")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion:
            {(user, error) in
                if error != nil {
                    print (error)
                   // Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                
                    self.present(alertController, animated: true, completion: nil)

                    return
                } else {
                    
//                    guard let uid = Auth.auth().currentUser?.uid else {
//                        return
//                    }
//                    let ref = Database.database().reference(fromURL: "https://uptickmarketplace-f31e9.firebaseio.com/")
//                    let userReference = ref.child("users").child(uid)
//                    userReference.observeSingleEvent(of: .value, with:
//                        {(snapshot) in
//                            if let dictionary = snapshot.value as? [String: AnyObject] {
//                                let currentUserData = User()
//                                self.currentUserData.setValuesForKeys(dictionary)
//                                print ("Inside observe")
//                                print (self.currentUserData)
//                            }
//                            
//                    }, withCancel: nil)
                    
                    self.performSegue(withIdentifier: "goingToProfile", sender: self)
                }
                
        })
    }
    
    func pickerViewDataGather () {
        let ref = Database.database().reference(fromURL: "https://uptickmarketplace-f31e9.firebaseio.com/")
        let schoolReference = ref.child("school")
        schoolReference.observe(.childAdded, with: {(snapshot) in
            self.schoolPickerData.append(snapshot.key)
            let dormList = snapshot.value as? [String]
            self.allDormData[snapshot.key] = [String]()
            var tempDormList = [String]()
            for item in dormList! {
                tempDormList.append(item)
            }
            self.allDormData[snapshot.key] = tempDormList
            
        }, withCancel: nil)
    }
    
    //sending data to other ViewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "goingToProfile" {
            //have to find out which viewController child is NavigationController
            //then if topViewController is indeed ProfileController
//            let barViewController = segue.destination as! UITabBarController
//            let nav = barViewController.viewControllers![3] as! UINavigationController
//            let profileViewController = barViewController.viewControllers![0] as! ProfileVC
//        print ("print in perform segue")
//        print (currentUserData.dorm)
//        print (self.currentUserData.dorm)
//            profileViewController.currentUserData = currentUserData
//            let homeViewController = barViewController.viewControllers![1] as! HomeVC
//            //HAVE TO PUT IN FOR MESSAGES AS WELL WHEN THAT VC IS DONE
//            homeViewController.currentUserData = currentUserData
//            let menuViewController = nav.topViewController as! MenuVC
//            menuViewController.currentUserData = currentUserData
        
//        }
    }
}

