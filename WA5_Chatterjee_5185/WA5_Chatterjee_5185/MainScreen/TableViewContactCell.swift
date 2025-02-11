//
//  TableViewContactCell.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class TableViewContactCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhoneInfo: UILabel!
    var profileImage: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhoneInfo()
        setupProfileImage()
        
        initConstraints()

    }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.cornerRadius = 5
        
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 8.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 3.0
        wrapperCellView.layer.shadowOpacity = 0.5
        
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName() {
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    
    func setupLabelPhoneInfo() {
        labelPhoneInfo = UILabel()
        labelPhoneInfo.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhoneInfo)
    }
    
    func setupProfileImage() {
        profileImage = UIImageView()
        profileImage.image = UIImage(systemName: "person.fill")
        profileImage.contentMode = .scaleToFill
        profileImage.clipsToBounds = true
        profileImage.tintColor = .gray
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(profileImage)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            profileImage.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            profileImage.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            profileImage.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -16),
            profileImage.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -16),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            labelName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelEmail.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            labelEmail.heightAnchor.constraint(equalToConstant: 20),
            
            labelPhoneInfo.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 4),
            labelPhoneInfo.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            labelPhoneInfo.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 76)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
