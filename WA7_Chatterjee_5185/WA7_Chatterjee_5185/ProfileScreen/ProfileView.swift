//
//  ProfileView.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import UIKit

class ProfileView: UIView {
        
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var logoutBtn: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupNameLabel()
        setupEmailLabel()
        setupLogoutBtn()
        
        initConstraints()
    }
    
    func setupNameLabel() {
        nameLabel = UILabel()
        nameLabel.text = ""
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
    }
    
    func setupEmailLabel() {
        emailLabel = UILabel()
        emailLabel.text = "Email: "
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailLabel)
    }
    
    func setupLogoutBtn() {
        logoutBtn = UIButton()
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.setTitleColor(.blue, for: .normal)
        logoutBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(logoutBtn)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 24),
            emailLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            logoutBtn.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 24),
            logoutBtn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
    
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
