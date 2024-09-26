//
//  ShowProfileScreen.swift
//  WA3_Chatterjee_5185
//
//  Created by agni on 9/26/24.
//

import UIKit

class ShowProfileView: UIView {
    
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneLabel = UILabel()
    private let addressLabel = UILabel()
    private let cityStateLabel = UILabel()
    private let zipLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupLabels()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupLabels() {
        let labels = [nameLabel, emailLabel, phoneLabel, addressLabel, cityStateLabel, zipLabel]
        let titles = ["Name:", "Email:", "Phone:", "Address:", "", "ZIP:"]
        
        for (index, label) in labels.enumerated() {
            label.text = titles[index]
            label.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(label)
        
            
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: CGFloat(20 + index * 30))
            ])
        }
    }
}
