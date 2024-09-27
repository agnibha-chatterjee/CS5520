//
//  ShowProfileScreen.swift
//  WA3_Chatterjee_5185
//
//  Created by agni on 9/26/24.
//

import UIKit

class ShowProfileView: UIView {
    
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var phoneLabel: UILabel!
    var addressLabel: UILabel!
    var cityStateLabel: UILabel!
    var zipLabel: UILabel!
    var phoneTypeImage: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupLabels()
        setupPhoneTypeImage()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupLabels() {
        let labelText = ["Name:", "Email:", "Phone:", "Address:", "", "ZIP:"]
        
        nameLabel = UILabel()
        emailLabel = UILabel()
        phoneLabel = UILabel()
        addressLabel = UILabel()
        cityStateLabel = UILabel()
        zipLabel = UILabel()
        
        let labels = [nameLabel, emailLabel, phoneLabel, addressLabel, cityStateLabel, zipLabel]
        
        for (index, label) in labels.enumerated() {
            label!.text = labelText[index]
            label!.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(label!)
            
            let topMargin: Int = index == 0 ? 32 : 16
            
            NSLayoutConstraint.activate([
                label!.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat(topMargin)),
                label!.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            ])
        }
    }
    
    func setupPhoneTypeImage() {
        phoneTypeImage = UIImageView()
        phoneTypeImage.contentMode = .scaleAspectFit
        phoneTypeImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phoneTypeImage)

        NSLayoutConstraint.activate([
            phoneTypeImage.topAnchor.constraint(equalTo: zipLabel.bottomAnchor, constant: 16),
            phoneTypeImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}
