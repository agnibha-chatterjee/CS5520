//
//  RegistratonViewController.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import UIKit

class RegistratonViewController: UIViewController {
    var registrationView = RegistrationView()
    
    let defaults = UserDefaults.standard
    
    override func loadView() {
        self.view = registrationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"
    }
    
}
