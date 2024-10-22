//
//  EditContactView.swift
//  WA6_Chatterjee_5185
//
//  Created by agni on 10/21/24.
//

import UIKit

class EditContactView: UIView {
    var scrollView: UIScrollView!
    var contentView: UIView!
    var textFieldEditName: UITextField!
    var textFieldEditEmail: UITextField!
    var textFieldEditPhone: UITextField!
    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupScrollView()
        setupContentView()
        setupTextFieldEditName()
        setupTextFieldEditEmail()
        setupTextFieldEditPhone()
        setupButtonSave()
        
        initConstraints()
    }
    
    func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
    }
    
    func setupContentView() {
        contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
    }
    
    func setupTextFieldEditName() {
        textFieldEditName = UITextField()
        textFieldEditName.placeholder = "Name"
        textFieldEditName.borderStyle = .roundedRect
        textFieldEditName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textFieldEditName)
    }
    
    func setupTextFieldEditEmail() {
        textFieldEditEmail = UITextField()
        textFieldEditEmail.placeholder = "Email"
        textFieldEditEmail.borderStyle = .roundedRect
        textFieldEditEmail.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textFieldEditEmail)
    }
    
    func setupTextFieldEditPhone() {
        textFieldEditPhone = UITextField()
        textFieldEditPhone.placeholder = "Phone"
        textFieldEditPhone.borderStyle = .roundedRect
        textFieldEditPhone.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textFieldEditPhone)
    }
    
    func setupButtonSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonSave.setTitle("Save Edited Contact", for: .normal)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonSave)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            textFieldEditName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            textFieldEditName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            textFieldEditName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            textFieldEditEmail.topAnchor.constraint(equalTo: textFieldEditName.bottomAnchor, constant: 20),
            textFieldEditEmail.leadingAnchor.constraint(equalTo: textFieldEditName.leadingAnchor),
            textFieldEditEmail.trailingAnchor.constraint(equalTo: textFieldEditName.trailingAnchor),
            
            textFieldEditPhone.topAnchor.constraint(equalTo: textFieldEditEmail.bottomAnchor, constant: 20),
            textFieldEditPhone.leadingAnchor.constraint(equalTo: textFieldEditName.leadingAnchor),
            textFieldEditPhone.trailingAnchor.constraint(equalTo: textFieldEditName.trailingAnchor),
            
            buttonSave.topAnchor.constraint(equalTo: textFieldEditPhone.bottomAnchor, constant: 32),
            buttonSave.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            buttonSave.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            buttonSave.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
