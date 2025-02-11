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
        
        self.registrationView.registerBtn.addTarget(self, action: #selector(onPressRegister), for: .touchUpInside)
    }
    
    @objc func onPressRegister() {
        if !validateAllFields() {
            return
        }
        
        let name = self.registrationView.nameField.text!
        let email = self.registrationView.emailField.text!
        let password = self.registrationView.passwordField.text!
        
        self.register(name: name, email: email, password: password)
    }
    
    func resetFields() {
        self.registrationView.emailField.text = ""
        self.registrationView.passwordField.text = ""
    }
    
    func validateEmptyFields() -> Bool {
        if self.registrationView.nameField.text?.isEmpty == true {
            showAlert(message: "Name cannot be empty")
            return false
        } else if self.registrationView.emailField.text?.isEmpty == true {
            showAlert(message: "Email cannot be empty")
            return false
        } else if self.registrationView.passwordField.text?.isEmpty == true {
            showAlert(message: "Password cannot be empty")
            return false
        }
        return true
    }
    
    func validateEmail() -> Bool {
        let email = self.registrationView.emailField.text!
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidEmail = emailPred.evaluate(with: email)
        
        if !isValidEmail {
            showAlert(message: "Email format is invalid")
        }
        
        return isValidEmail
    }
    
    func validateAllFields() -> Bool {
        if !validateEmptyFields() {
            return false
        }
        if !validateEmail() {
            return false
        }
        return true
    }
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
}
