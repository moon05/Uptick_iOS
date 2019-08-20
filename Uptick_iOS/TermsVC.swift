//
//  TermsViewController.swift
//  Uptick_iOS
//
//  Created by Abdullah Al Mamun on 7/20/19.
//  Copyright © 2019 Abdullah Al Mamun. All rights reserved.
//

import UIKit

class TermsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
