//
//  DisplayContactViewController.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class DisplayContactViewController: UIViewController {
    
    let displayProfileView = DisplayContactView()
    var contact: Contact? = nil
    var delegate: MainScreenViewController!

    override func loadView() {
        view = displayProfileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit, target: self,
            action: #selector(onEditBtnTapped)
        )
            
        displayProfileData()
    }
    
    @objc func onEditBtnTapped() {
        let editProfileViewController = EditContactViewController()
        editProfileViewController.delegate = self.delegate
        editProfileViewController.contact = self.contact
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(editProfileViewController, animated: true)
    }
    
//    func delegateEditContact(_ updatedContact: Contact) {
//        self.delegate.delegateOnEditContact(updatedContact)
//        
//    }

    func displayProfileData() {
        displayProfileView.contactImage.image = contact!.image
        displayProfileView.nameLabel.text! = " \(contact!.name)"
        displayProfileView.emailLabel.text! += " \(contact!.email)"
        displayProfileView.phoneLabel.text! += " \(contact!.phoneNumber) (\(contact!.phoneType))"
        displayProfileView.addressLabel.text! = " \(contact!.address)"
        displayProfileView.cityStateLabel.text! = contact!.cityState
        displayProfileView.zipLabel.text! = " \(contact!.zip)"
    }
    
}
