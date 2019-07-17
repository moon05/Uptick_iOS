//
//  ViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/14/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    @IBAction func loginAccount(sender:AnyObject) {
        if self.emailField.text == "" || self.passwordField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().signIn(withEmail: self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    self.performSegue(withIdentifier: "Home", sender: self)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

