//
//  SignUpViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/14/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var mobileNumberField: UITextField!
    @IBOutlet var universityCampusChooseField: UIPickerView!
    @IBOutlet var dormChooseField: UIPickerView!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var passwordConfirmField: UITextField!
    @IBOutlet var toucIDActivateField: UISwitch!
    @IBOutlet var continueButton: UIButton!
    
    @IBAction func createAccount(sender:AnyObject) {
        if firstNameField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your First Name", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        else if lastNameField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your Last Name", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        else if emailField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your university email address", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        else if mobileNumberField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your Phone Number", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        else if passwordField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your desired Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        else if passwordConfirmField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please re-enter your Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        else if passwordField.text != passwordConfirmField.text {
            let alertController = UIAlertController(title: "Error", message: "Password does not match! Please enter the same password in both fields!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }
        
        else {
            Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
                if error == nil {
                    print ("You have successfully signed up!")
                    
                    self.performSegue(withIdentifier: "Home", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
        
        
        
        
    }
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        mobileNumberField.resignFirstResponder()
        universityCampusChooseField.resignFirstResponder()
        dormChooseField.resignFirstResponder()
        passwordField.resignFirstResponder()
        passwordConfirmField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
