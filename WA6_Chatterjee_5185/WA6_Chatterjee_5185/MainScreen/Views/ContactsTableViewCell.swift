//
//  ContactsTableViewCell.swift
//  WA6_Chatterjee_5185
//
//  
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var buttonOptions: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupButtonOptions()
        
        initConstraints()
    }

    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 4.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 2.0
        wrapperCellView.layer.shadowOpacity = 0.7
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupButtonOptions(){
        buttonOptions = UIButton(type: .system)
        buttonOptions.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        buttonOptions.tintColor = .darkGray
        buttonOptions.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(buttonOptions)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 44),
            
            buttonOptions.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            buttonOptions.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
            buttonOptions.widthAnchor.constraint(equalToConstant: 30),
            buttonOptions.heightAnchor.constraint(equalToConstant: 30),
            
            labelName.trailingAnchor.constraint(equalTo: buttonOptions.leadingAnchor, constant: -10)
        ])
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
