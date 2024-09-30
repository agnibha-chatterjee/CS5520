//
//  CreateContactViewController.swift
//  WA4_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit


class CreateContactViewController: UIViewController {
    
    let createContactView = CreateContactView()
    
    let phoneTypes = ["Cell", "Home", "Work"]
    var selectedPhoneType = "Cell"
    
    var delegate: MainScreenViewController!
    
    override func loadView() {
        view = createContactView
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        createContactView.phoneTypePicker.delegate = self
        createContactView.phoneTypePicker.dataSource = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(onSaveBarButtonTapped)
        )
    }
    
    @objc func onSaveBarButtonTapped() {
        if !validateAllFields() {
            return
        }
       
    
        let newContact = Contact(name: createContactView.nameField.text!,
                                 email: createContactView.emailField.text!,
                                 phoneType: selectedPhoneType,
                                 phoneNumber: Int(createContactView.phoneNumberField.text!)!,
                                 address: createContactView.addressField.text!,
                                 cityState: createContactView.cityStateField.text!,
                                 zip: Int(createContactView.zipField.text!)!)
        
        self.delegate.delegateOnAddContact(newContact)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
    
    func validateEmptyFields() -> Bool {
        if createContactView.nameField.text?.isEmpty == true {
            showAlert(message: "Name cannot be empty")
            return false
        } else if createContactView.emailField.text?.isEmpty == true {
            showAlert(message: "Email cannot be empty")
            return false
        } else if createContactView.phoneNumberField.text?.isEmpty == true {
            showAlert(message: "Phone cannot be empty")
            return false
        } else if createContactView.addressField.text?.isEmpty == true {
            showAlert(message: "Address cannot be empty")
            return false
        } else if createContactView.cityStateField.text?.isEmpty == true {
            showAlert(message: "City/State cannot be empty")
            return false
        } else if createContactView.zipField.text?.isEmpty == true {
            showAlert(message: "Zip cannot be empty")
            return false
        }
        return true
    }
    
    func validateEmail() -> Bool {
        let email = createContactView.emailField.text!
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

        if createContactView.phoneNumberField.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Phone number must contain only digits")
            return false
        } else if createContactView.phoneNumberField.text!.count != 10 {
            showAlert(message: "Phone number must be exactly 10 digits long")
            return false
        }
        return true
    }

    func validateCityState() -> Bool {
        let components = createContactView.cityStateField.text!.split(separator: ",").map { component in
            component.trimmingCharacters(in: .whitespaces)
        }
        if components.count != 2 {
            showAlert(message: "City, State must be in the format 'City, State'")
            return false
        }
        return true
    }

    func validateZipCode() -> Bool {
        let digitsCharacterSet = CharacterSet.decimalDigits
        if createContactView.zipField.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Zip code must contain only digits")
            return false
        } else if createContactView.zipField.text?.count != 5 {
            showAlert(message: "Zip code must be exactly 5 digits long")
            return false
        } else if let zip = Int(createContactView.zipField.text!), zip < 1 || zip > 99950 {
            showAlert(message: "Invalid Zip code! Zip code must be between 00001 and 99950")
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
        if !validateCityState() {
            return false
        }
        if !validateZipCode() {
            return false
        }
        return true
    }
}

extension CreateContactViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return phoneTypes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedPhoneType = phoneTypes[row]
        return phoneTypes[row]
    }
}


