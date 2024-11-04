//
//  ProfileViewController.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    let defaults = UserDefaults.standard
    
    var loggedInUser: User? = nil
    
    override func loadView() {
        self.view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileView.logoutBtn.addTarget(self, action: #selector(onLogoutPress), for: .touchUpInside)
        
        let accessToken = defaults.string(forKey: "accessToken")!
        self.getUserDetails(token: accessToken)
    }
    
    @objc func onLogoutPress() {
        self.logout()
    }
    
    func displayProfileData(user: User) {
        self.profileView.nameLabel.text! = " \(user.name)"
        self.profileView.emailLabel.text! += " \(user.email)"
    }
}

