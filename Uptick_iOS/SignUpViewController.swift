//
//  SignUpViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/14/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var firstNameField: UITextField!
    @IBOutlet var lastNameField: UITextField!
    @IBOutlet var emailNameField: UITextField!
    @IBOutlet var mobileNumberField: UITextField!
    @IBOutlet var universityCampusChooseField: UIPickerView!
    @IBOutlet var dormChooseField: UIPickerView!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var passwordConfirmField: UITextField!
    @IBOutlet var toucIDActivateField: UISwitch!
    @IBOutlet var continueButton: UIButton!
    
    @IBAction func continueButtonClicked(sender:AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}
