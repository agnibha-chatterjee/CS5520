//
//  EditContactViewController.swift
//  WA6_Chatterjee_5185
//
//  Created by agni on 10/21/24.
//

import UIKit
import Alamofire

class EditContactViewController: UIViewController {
    
    let editContactScreen = EditContactView()
    let contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = editContactScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Contact"
        
        editContactScreen.textFieldEditName.text = contact.name
        editContactScreen.textFieldEditEmail.text = contact.email
        editContactScreen.textFieldEditPhone.text = String(contact.phone)

        editContactScreen.buttonSave.addTarget(self, action: #selector(saveContact), for: .touchUpInside)
        
    }

    @objc func saveContact() {
        if !validateAllFields() {
            return
        }

        let updatedContact = Contact(name: editContactScreen.textFieldEditName.text!,
                                     email: editContactScreen.textFieldEditEmail.text!,
                                     phone: Int(editContactScreen.textFieldEditPhone.text!)!)
        
        if let url = URL(string: APIConfigs.baseURL + "delete") {
            AF.request(url, method: .get, parameters: ["name": contact.name], encoding: URLEncoding.queryString)
                .responseString { response in
                    let status = response.response?.statusCode
                    
                    switch response.result {
                    case .success(let data):
                        if let uwStatusCode = status {
                            switch uwStatusCode {
                            case 200...299:
                                print("deleted successfully")
                                self.addUpdatedContact(updatedContact)
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
    
    func addUpdatedContact(_ updatedContact: Contact) {
        if let url = URL(string: APIConfigs.baseURL+"add"){
            AF.request(url, method:.post, parameters:
                        [
                            "name": updatedContact.name,
                            "email": updatedContact.email,
                            "phone": updatedContact.phone
                        ])
                .responseString(completionHandler: { response in
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                print("added successfully")
                                // self.getAllContacts()
                                // self.clearAddViewFields()
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
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
    
    func validateEmail() -> Bool {
        let email = editContactScreen.textFieldEditEmail.text!
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

        if editContactScreen.textFieldEditPhone.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Phone number must contain only digits")
            return false
        } else if editContactScreen.textFieldEditPhone.text!.count != 10 {
            showAlert(message: "Phone number must be exactly 10 digits long")
            return false
        }
        return true
    }

    func validateEmptyFields() -> Bool {
        if editContactScreen.textFieldEditName.text?.isEmpty == true {
            showAlert(message: "Name cannot be empty")
            return false
        } else if editContactScreen.textFieldEditEmail.text?.isEmpty == true {
            showAlert(message: "Email cannot be empty")
            return false
        } else if editContactScreen.textFieldEditPhone.text?.isEmpty == true {
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
    
}
