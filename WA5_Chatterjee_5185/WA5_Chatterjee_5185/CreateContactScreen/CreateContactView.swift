//
//  CreateContactView.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit
import PhotosUI

class CreateContactView: UIView {

    var nameField: UITextField!
    var photoPickerBtn: UIButton!
    var photoLabel: UILabel!
    var emailField: UITextField!
    var phoneNumberField: UITextField!
    var addressField: UITextField!
    var cityStateField: UITextField!
    var zipField: UITextField!
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.backgroundColor = .white

        setupNameField()
        setupPhotoPickerBtn()
        setupPhotoLabel()
        setupEmailField()
        setupPhoneNumberField()
        setupAddressField()
        setupCityStateField()
        setupZipField()
        initConstraints()
    }
    
    func setupNameField() {
        nameField = UITextField()
        nameField.placeholder = "Name"
        nameField.borderStyle = .roundedRect
        nameField.keyboardType = .namePhonePad
        nameField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameField)
    }
    
    func setupPhotoPickerBtn() {
        photoPickerBtn = UIButton(type: .system)
        photoPickerBtn.showsMenuAsPrimaryAction = true
        photoPickerBtn.setTitle("", for: .normal)
        photoPickerBtn.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        photoPickerBtn.contentHorizontalAlignment = .fill
        photoPickerBtn.contentVerticalAlignment = .fill
        photoPickerBtn.imageView?.contentMode = .scaleAspectFit
        photoPickerBtn.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(photoPickerBtn)
    }
    
    func setupPhotoLabel() {
        photoLabel = UILabel()
        photoLabel.text = "Photo"
        photoLabel.font = photoLabel.font.withSize(22)
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(photoLabel)
    }
    
    func setupEmailField() {
        emailField = UITextField()
        emailField.placeholder = "Email"
        emailField.borderStyle = .roundedRect
        nameField.keyboardType = .emailAddress
        emailField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailField)
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
            nameField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 48),
            nameField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            nameField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            photoPickerBtn.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16),
            photoPickerBtn.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            photoPickerBtn.heightAnchor.constraint(equalToConstant: 100),
            photoPickerBtn.widthAnchor.constraint(equalToConstant: 100),
            
            photoLabel.topAnchor.constraint(equalTo: photoPickerBtn.bottomAnchor, constant: -16),
            photoLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            emailField.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 16),
            emailField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            emailField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            phoneNumberField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 16),
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
