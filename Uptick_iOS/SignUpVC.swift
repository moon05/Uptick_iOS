//
//  SignUpViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/14/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignUpVC: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var mobileNumberField: UITextField!
    @IBOutlet var universityPicker: UIPickerView!
    @IBOutlet var dormPicker: UIPickerView!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var passwordConfirmField: UITextField!
    @IBOutlet var toucIDActivateField: UISwitch!
    @IBOutlet var continueButton: UIButton!
    
    var schoolPickerData: [String] = [String]()
    var allDormData: [String: [String]] = [String: [String]]()
    var selectedDormData: [String] = [String]()
    
    var chosenSchool: String!
    var chosenDorm: String!
    
    var testing: String!
    
    let currentUserData = User()

    
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
                    
                    guard let uid = user?.user.uid else {
                        return
                    }
                    let ref = Database.database().reference(fromURL: "https://uptickmarketplace-f31e9.firebaseio.com/")
                    let userReference = ref.child("users").child(uid)
                    let values = ["firstname": self.firstNameField.text!, "lastname": self.lastNameField.text!, "email": self.emailField.text!, "phone": self.mobileNumberField.text!, "school": self.chosenSchool, "dorm": self.chosenDorm]
                    userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                        if err != nil {
                            print (err as Any)
                            return
                        }
                        self.currentUserData.setValuesForKeys(values as [String : Any])
                        print ("Saved user successfully into Firebase db")
                    })
                    
                    self.performSegue(withIdentifier: "goingToProfile", sender: self)
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
        universityPicker.resignFirstResponder()
        dormPicker.resignFirstResponder()
        passwordField.resignFirstResponder()
        passwordConfirmField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        
        print ("Inside SignUpViewController")
        print (schoolPickerData)
        print (allDormData)

        self.universityPicker.delegate = self
        self.universityPicker.dataSource = self
        
        self.dormPicker.delegate = self
        self.dormPicker.dataSource = self
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == universityPicker {
            return schoolPickerData.count
        } else if pickerView == dormPicker {
            return selectedDormData.count
        } else {
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == universityPicker {
            return schoolPickerData[row]
        } else if pickerView == dormPicker {
            return selectedDormData[row]
        } else {
            return "Other"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == universityPicker {
            chosenSchool = schoolPickerData[row]
            if chosenSchool != nil {
                selectedDormData = allDormData[chosenSchool]!
            } else {
                selectedDormData = []
            }
            
            dormPicker.reloadAllComponents()
        } else if pickerView == dormPicker {
            chosenDorm = selectedDormData[row]
        } else {
            
        }
    }
    
    //sending data to other ViewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "goingToProfile" {
            let profileController = segue.destination as! ProfileVC
            profileController.currentUserData = currentUserData
            
        }
    }
    
}
