//
//  DisplayContactView.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class DisplayContactView: UIView {
    
    var contactImage: UIImageView!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var phoneLabel: UILabel!
    var addressTextLabel: UILabel!
    var addressLabel: UILabel!
    var cityStateLabel: UILabel!
    var zipLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupContactImage()
        setupNameLabel()
        setupEmailLabel()
        setupPhoneLabel()
        setupAddressTextLabel()
        setupAddressInfoLabels()
        
        initConstraints()
    }
    
    func setupContactImage() {
        contactImage = UIImageView()
        contactImage.contentMode = .scaleToFill
        contactImage.clipsToBounds = true
        contactImage.tintColor = .gray
        contactImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contactImage)
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
    
    func setupPhoneLabel() {
        phoneLabel = UILabel()
        phoneLabel.text = "Phone: "
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneLabel)
    }
    
    func setupAddressTextLabel() {
        addressTextLabel = UILabel()
        addressTextLabel.text = "Address:"
        addressTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
        addressTextLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addressTextLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            contactImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            contactImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            contactImage.widthAnchor.constraint(equalToConstant: 80),
            contactImage.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: self.contactImage.bottomAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            emailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 24),
            emailLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phoneLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 24),
            phoneLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            addressTextLabel.topAnchor.constraint(equalTo: self.phoneLabel.bottomAnchor, constant: 24),
            addressTextLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    func setupAddressInfoLabels() {
        addressLabel = UILabel()
        cityStateLabel = UILabel()
        zipLabel = UILabel()
        
        let labels = [addressLabel, cityStateLabel, zipLabel]
        
        for (index, label) in labels.enumerated() {
            label?.text = ""
            label!.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(label!)
            
            let topMargin: Int = 20 + (index * 20)
            
            NSLayoutConstraint.activate([
                label!.topAnchor.constraint(equalTo: addressTextLabel.topAnchor, constant: CGFloat(topMargin)),
                label!.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
