//
//  ViewController.swift
//  WA6_Chatterjee_5185
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    var contactNames = [String]()
    
    let notificationCenter = NotificationCenter.default


    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "All Contacts"
        
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.separatorStyle = .none

        
        getAllContacts()
        
        mainScreen.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)

        notificationCenter.addObserver(
        self, 
        selector: #selector(refreshContacts(notification:)),
        name: Notification.Name("refreshContacts"),
        object: nil)
    }

    @objc func refreshContacts(notification: Notification){
        getAllContacts()
    }

    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
    

    func validateEmail() -> Bool {
        let email = mainScreen.textFieldAddEmail.text!
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidEmail = emailPred.evaluate(with: email)
        
        if !isValidEmail {
            showAlert(message: "Email format is invalid")
        }
        
        return isValidEmail
    }
    
    func validatePhoneNumber() -> Bool {
        let digitsCharacterSet = CharacterSet.decimalDigits

        if mainScreen.textFieldAddPhone.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Phone number must contain only digits")
            return false
        } else if mainScreen.textFieldAddPhone.text!.count != 10 {
            showAlert(message: "Phone number must be exactly 10 digits long")
            return false
        }
        return true
    }

    func validateEmptyFields() -> Bool {
        if mainScreen.textFieldAddName.text?.isEmpty == true {
            showAlert(message: "Name cannot be empty")
            return false
        } else if mainScreen.textFieldAddEmail.text?.isEmpty == true {
            showAlert(message: "Email cannot be empty")
            return false
        } else if mainScreen.textFieldAddPhone.text?.isEmpty == true {
            showAlert(message: "Phone cannot be empty")
            return false
        }
        return true
    }

    func validateAllFields() -> Bool {
        if !validateEmptyFields() {
            return false
        }
        if !validateEmail() {
            return false
        }
        if !validatePhoneNumber() {
            return false
        }
        return true
    }
    
    @objc func onButtonAddTapped(){

        if !validateAllFields() {
            return
        }

        
         let newContact = Contact(name: mainScreen.textFieldAddName.text!,
                                 email: mainScreen.textFieldAddEmail.text!,
                                 phone: Int(mainScreen.textFieldAddPhone.text!)!)

        addANewContact(contact: newContact)
    }
    
    func clearAddViewFields(){
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }
    
    func addANewContact(contact: Contact){
        if let url = URL(string: APIConfigs.baseURL+"add"){
            
            AF.request(url, method:.post, parameters:
                        [
                            "name": contact.name,
                            "email": contact.email,
                            "phone": contact.phone
                        ])
                .responseString(completionHandler: { response in
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                self.getAllContacts()
                                self.clearAddViewFields()
                                    break
                        
                                case 400...499:
                                    print(data)
                                    break
                        
                                default:
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        print(error)
                        break
                    }
                })
        }else{
            showAlert(message: "Invalid API")
        }
    }
    
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                                let names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.mainScreen.tableViewContacts.reloadData()
                                print(self.contactNames)
                                break
                    
                            case 400...499:
                                print(data)
                                break
                    
                            default:
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }
    
    func getContactDetails(name: String){
        if let url = URL(string: APIConfigs.baseURL+"details"){
            AF.request(url, method:.get,
                       parameters: ["name":name],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                                let parts = data.components(separatedBy: ",")
                                let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
                                let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                                if let phone = Int(parts[2].trimmingCharacters(in: .whitespacesAndNewlines)) {
                                    let contact = Contact(name: name, email: email, phone: phone)
                                    self.navigateToDisplayContact(contact: contact)
                                }
                                break
                    
                            case 400...499:
                                print(data)
                                break
                    
                            default:
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }
    
    func navigateToDisplayContact(contact: Contact) {
        let displayContactController = DisplayContactController(contact: contact)
        navigationController?.pushViewController(displayContactController, animated: true)
    }

    func handleDeleteContact(name: String) {
        let alert = UIAlertController(title: "Delete Contact", message: "Are you sure you want to delete \(name)?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteContact(name: name)
        }))
        
        self.present(alert, animated: true)
    }

    func deleteContact(name: String) {
        if let url = URL(string: APIConfigs.baseURL + "delete") {
            AF.request(url, method: .get, parameters: ["name": name], encoding: URLEncoding.queryString)
                .responseString { response in
                    let status = response.response?.statusCode
                    
                    switch response.result {
                    case .success(let data):
                        if let uwStatusCode = status {
                            switch uwStatusCode {
                            case 200...299:
                                self.getAllContacts()
                            case 400...499:
                                print("Error: \(data)")
                            default:
                                print("Error: \(data)")
                            }
                        }
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
        } else {
            showAlert(message: "Invalid API")
        }
    }

    func editDeleteMenu(for name: String) -> UIMenu {
        let menuItems = [
            UIAction(title: "Edit", handler: { _ in
                self.getContactDetailsForEdit(name: name)
            }),
            UIAction(title: "Delete", handler: { _ in
                self.handleDeleteContact(name: name)
            }),
        ]
               
        return UIMenu(title: "Select action", children: menuItems)
    }

    func getContactDetailsForEdit(name: String) {
        if let url = URL(string: APIConfigs.baseURL+"details") {
            AF.request(url, method: .get,
                       parameters: ["name": name],
                       encoding: URLEncoding.queryString)
                .responseString { response in
                    switch response.result {
                    case .success(let data):
                        if let statusCode = response.response?.statusCode, (200...299).contains(statusCode) {
                            let parts = data.components(separatedBy: ",")
                            let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
                            let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                            if let phone = Int(parts[2].trimmingCharacters(in: .whitespacesAndNewlines)) {
                                let contact = Contact(name: name, email: email, phone: phone)
                                self.navigateToEditContact(contact: contact)
                            }
                        } else {
                            print("Error: \(data)")
                        }
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }
        }
    }

    func navigateToEditContact(contact: Contact) {
        let editContactController = EditContactViewController(contact: contact)
        navigationController?.pushViewController(editContactController, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getContactDetails(name: self.contactNames[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let name = self.contactNames[indexPath.row]
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
            return self.editDeleteMenu(for: name)
        }
    }
}
