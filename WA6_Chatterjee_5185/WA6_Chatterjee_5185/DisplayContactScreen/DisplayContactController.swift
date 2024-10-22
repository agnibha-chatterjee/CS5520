//
//  DisplayContactController.swift
//  WA6_Chatterjee_5185
//
//  Created by agni on 10/21/24.
//

import UIKit

class DisplayContactController: UIViewController {
    
    let displayView = DisplayContactView()
    let contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = displayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = contact.name
        
        displayView.nameLabel.text = "Name: \(contact.name)"
        displayView.emailLabel.text = "Email: \(contact.email)"
        displayView.phoneLabel.text = "Phone: \(contact.phone)"
    }
}

