//
//  LoginScreenView.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import UIKit

class LoginView: UIView {
    
    var emailField: UITextField!
    var passwordField: UITextField!
    var loginBtn: UIButton!
    var registerBtn: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupEmailField()
        setupPasswordField()
        setupLoginBtn()
        setupRegisterBtn()
        
        initConstraints()
    }
    
    func setupEmailField() {
        emailField = UITextField()
        emailField.keyboardType = .emailAddress
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        emailField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailField)
    }
    
    func setupPasswordField() {
        passwordField = UITextField()
        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passwordField)
    }
    
    func setupLoginBtn() {
        loginBtn = UIButton()
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(.blue, for: .normal)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginBtn)
    }
    
    func setupRegisterBtn() {
        registerBtn = UIButton()
        registerBtn.setTitle("Don't have an account? Register here", for: .normal)
        registerBtn.setTitleColor(.blue, for: .normal)
        registerBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(registerBtn)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            
            emailField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 48),
            emailField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            emailField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            passwordField.topAnchor.constraint(equalTo: self.emailField.topAnchor, constant: 48),
            passwordField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            passwordField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            loginBtn.topAnchor.constraint(equalTo: self.passwordField.topAnchor, constant: 48),
            loginBtn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            registerBtn.topAnchor.constraint(equalTo: self.loginBtn.topAnchor, constant: 32),
            registerBtn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
