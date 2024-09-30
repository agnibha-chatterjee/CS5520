//
//  ViewController.swift
//  WA4_Chatterjee_5185
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
        self.view = mainScreenView
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        contacts.append(Contact(name: "Agni",
                                email: "agni@agni.com",
                                phoneType: "Cell",
                                phoneNumber: "9901199218",
                                address: "601 William St",
                                cityState: "Oak",
                                zip: "94612"))
        contacts.append(Contact(name: "Sruti",
                                email: "s@s.com",
                                phoneType: "Work",
                                phoneNumber: "425654221",
                                address: "435 William St",
                                cityState: "New Port",
                                zip: "92612"))
        
        mainScreenView.tableViewContacts.dataSource = self
        mainScreenView.tableViewContacts.delegate = self
    }
    
    @objc func onAddBarButtonTapped() {
          
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
        return cell
    }
    
    
}

