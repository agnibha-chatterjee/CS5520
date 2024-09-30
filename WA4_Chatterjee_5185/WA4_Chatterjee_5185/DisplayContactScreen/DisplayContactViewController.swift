//
//  DisplayContactViewController.swift
//  WA4_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class DisplayContactViewController: UIViewController {
    
    let displayProfileView = DisplayContactView()
    var contact: Contact? = nil


    override func loadView() {
        view = displayProfileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        displayProfileData()
    }

    func displayProfileData() {
        displayProfileView.nameLabel.text! += " \(contact!.name)"
        displayProfileView.emailLabel.text! += " \(contact!.email)"
        displayProfileView.phoneLabel.text! += " \(contact!.phoneNumber) (\(contact!.phoneType))"
        displayProfileView.addressLabel.text! += " \(contact!.address)"
        displayProfileView.cityStateLabel.text! += contact!.cityState
        displayProfileView.zipLabel.text! += " \(contact!.zip)"
    }
    
}
