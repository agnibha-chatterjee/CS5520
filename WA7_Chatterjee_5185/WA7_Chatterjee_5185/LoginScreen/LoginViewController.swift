//
//  LoginViewController.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        
        loginView.registerBtn.addTarget(self, action: #selector(onClickRegisterBtn), for: .touchUpInside)
        
        self.view = loginView
        
        if isUserAuthenticated() {
            let notesViewController = NotesViewController()
            self.navigationController?.pushViewController(notesViewController, animated: true)
        }
    }
    
    @objc func onClickRegisterBtn() {
        let registraionViewController = RegistratonViewController()
        self.navigationController?.pushViewController(registraionViewController, animated: true)
    }
    
    func isUserAuthenticated() -> Bool {
        if let _ = UserDefaults.standard.string(forKey: "accessToken") {
            return true
        }
        
        return false
    }
}
