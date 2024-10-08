//
//  CreateContactView.swift
//  WA4_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class CreateContactView: UIView {
    
    var titleLabel: UILabel!
    var nameField: UITextField!
    var emailField: UITextField!
    var addPhoneLabel: UILabel!
    var selectTypeLabel: UILabel!
    var phoneTypePicker: UIPickerView!
    var phoneNumberField: UITextField!
    var addressField: UITextField!
    var cityStateField: UITextField!
    var zipField: UITextField!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.backgroundColor = .white
        
        setupTitleLabel()
        setupNameField()
        setupEmailField()
        setupAddPhoneLabel()
        setupSelectTypeLabel()
        setupPhoneTypePicker()
        setupPhoneNumberField()
        setupAddressField()
        setupCityStateField()
        setupZipField()
        initConstraints()
    }
    
    func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.text = "Add a New Contact"
        titleLabel.font = titleLabel.font.withSize(20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
    }
    
    func setupNameField() {
        nameField = UITextField()
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.keyboardType = .namePhonePad
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }
    
    func setupEmailField() {
        emailField = UITextField()
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        nameField.keyboardType = .emailAddress
        emailField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailField)
    }

    func setupAddPhoneLabel() {
        addPhoneLabel = UILabel()
        addPhoneLabel.text = "Add Phone"
        addPhoneLabel.font = addPhoneLabel.font.withSize(22)
        addPhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addPhoneLabel)
    }

    func setupSelectTypeLabel() {
        selectTypeLabel = UILabel()
        selectTypeLabel.text = "Select Type:"
        selectTypeLabel.font = selectTypeLabel.font.withSize(18)
        selectTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(selectTypeLabel)
    }

    func setupPhoneTypePicker() {
        phoneTypePicker = UIPickerView()
        phoneTypePicker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneTypePicker)
    }

    func setupPhoneNumberField() {
        phoneNumberField = UITextField()
        phoneNumberField.placeholder = "Phone Number"
        phoneNumberField.borderStyle = .roundedRect
        phoneNumberField.keyboardType = .phonePad
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneNumberField)
    }

    func setupAddressField() {
        addressField = UITextField()
        addressField.placeholder = "Address"
        addressField.borderStyle = .roundedRect
        addressField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addressField)
    }

    func setupCityStateField() {
        cityStateField = UITextField()
        cityStateField.placeholder = "City, State"
        cityStateField.borderStyle = .roundedRect
        cityStateField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cityStateField)
    }

    func setupZipField() {
        zipField = UITextField()
        zipField.placeholder = "Zip Code"
        zipField.borderStyle = .roundedRect
        zipField.keyboardType = .numberPad
        zipField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zipField)
    }

   
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
            nameField.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.topAnchor, constant: 32),
            nameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16),
            emailField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            emailField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            addPhoneLabel.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            addPhoneLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            selectTypeLabel.topAnchor.constraint(equalTo: addPhoneLabel.bottomAnchor, constant: 8),
            selectTypeLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            phoneTypePicker.topAnchor.constraint(equalTo: selectTypeLabel.bottomAnchor, constant: -8),
            phoneTypePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            // phoneTypePicker.heightAnchor.constraint(equalToConstant: 80),

            phoneNumberField.topAnchor.constraint(equalTo: phoneTypePicker.bottomAnchor, constant: 16),
            phoneNumberField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            phoneNumberField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            addressField.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 16),
            addressField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            addressField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            cityStateField.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 16),
            cityStateField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            cityStateField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            zipField.topAnchor.constraint(equalTo: cityStateField.bottomAnchor, constant: 16),
            zipField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            zipField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
