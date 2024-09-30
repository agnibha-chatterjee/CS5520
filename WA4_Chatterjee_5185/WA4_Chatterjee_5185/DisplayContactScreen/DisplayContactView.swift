//
//  DisplayContactView.swift
//  WA4_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class DisplayContactView: UIView {
    
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var phoneLabel: UILabel!
    var addressLabel: UILabel!
    var cityStateLabel: UILabel!
    var zipLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupLabels()
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
            
            let topMargin: Int = 32 + (index * 40)
            
            NSLayoutConstraint.activate([
                label!.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat(topMargin)),
                label!.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
