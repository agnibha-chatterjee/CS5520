//
//  MainScreenViewController.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    let mainScreenView = MainScreenView()
    var contacts = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Contacts"
        self.navigationItem.backButtonTitle = "Back"
        self.view = mainScreenView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        contacts.append(Contact(name: "Sample",
                                image: UIImage(systemName: "person.fill")!,
                                email: "sample@sample.com",
                                phoneType: "Cell",
                                phoneNumber: 1112223331,
                                address: "156 2nd St",
                                cityState: "San Francisco, CA",
                                zip: 92612))
    
        mainScreenView.tableViewContacts.dataSource = self
        mainScreenView.tableViewContacts.delegate = self
        
        mainScreenView.tableViewContacts.separatorStyle = .none
    }
    
    func delegateOnAddContact(_ contact: Contact) {
        contacts.append(contact)
        mainScreenView.tableViewContacts.reloadData()
    }
    
    @objc func onAddBarButtonTapped() {
        let createContactViewController = CreateContactViewController()
        createContactViewController.delegate = self
        self.navigationController?.pushViewController(createContactViewController, animated: true)
    }
    
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactCell
        let idx = indexPath.row
        cell.labelName.text = contacts[idx].name
        cell.labelEmail.text = contacts[idx].email
        let phoneNumber = contacts[idx].phoneNumber
        let phoneType = contacts[idx].phoneType
        cell.labelPhoneInfo.text = "\(phoneNumber) (\(phoneType))"
        cell.profileImage.image = contacts[idx].image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedContact = self.contacts[indexPath.row]
        let displayProfileViewController = DisplayContactViewController()
        displayProfileViewController.contact = selectedContact
        
        self.navigationController?.pushViewController(displayProfileViewController, animated: true)
    }
}

