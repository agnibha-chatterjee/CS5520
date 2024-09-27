//
//  ViewController.swift
//  WA3_Chatterjee_5185
//
//  Created by agni on 9/25/24.
//

import UIKit



class CreateProfileViewController: UIViewController {

    public struct Profile {
        var name: String
        var email: String
        var phoneType: String
        var phoneNumber: String
        var address: String
        var cityState: String
        var zip: String

        init(name: String, email: String, phoneType: String, phoneNumber: String, address: String, cityState: String, zip: String) {
            self.name = name
            self.email = email
            self.phoneType = phoneType  
            self.phoneNumber = phoneNumber
            self.address = address
            self.cityState = cityState
            self.zip = zip
        }
    }   
    
    let createProfileView = CreateProfileView()
    
    let phoneTypes = ["Cell", "Home", "Work"]
    var selectedPhoneType = "Cell"
    
    override func loadView() {
        view = createProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create Profile"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 26)]
        navigationController?.navigationBar.setTitleVerticalPositionAdjustment(16, for: .default)
        
        
        createProfileView.phoneTypePicker.delegate = self
        createProfileView.phoneTypePicker.dataSource = self
        
        createProfileView.showProfileButton.addTarget(self, action: #selector(handleShowProfilePress), for: .touchUpInside)
    }
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
    
    func validateEmptyFields() -> Bool {
        if createProfileView.nameField.text?.isEmpty == true {
            showAlert(message: "Name cannot be empty")
            return false
        } else if createProfileView.emailField.text?.isEmpty == true {
            showAlert(message: "Email cannot be empty")
            return false
        } else if createProfileView.phoneNumberField.text?.isEmpty == true {
            showAlert(message: "Phone cannot be empty")
            return false
        } else if createProfileView.addressField.text?.isEmpty == true {
            showAlert(message: "Address cannot be empty")
            return false
        } else if createProfileView.cityStateField.text?.isEmpty == true {
            showAlert(message: "City/State cannot be empty")
            return false
        } else if createProfileView.zipField.text?.isEmpty == true {
            showAlert(message: "Zip cannot be empty")
            return false
        }
        return true
    }
    
    func validateEmail() -> Bool {
        let email = createProfileView.emailField.text!
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

        if createProfileView.phoneNumberField.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Phone number must contain only digits")
            return false
        } else if createProfileView.phoneNumberField.text!.count != 10 {
            showAlert(message: "Phone number must be exactly 10 digits long")
            return false
        }
        return true
    }

    func validateCityState() -> Bool {
        let components = createProfileView.cityStateField.text!.split(separator: ",").map { component in
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
        if createProfileView.zipField.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Zip code must contain only digits")
            return false
        } else if createProfileView.zipField.text?.count != 5 {
            showAlert(message: "Zip code must be exactly 5 digits long")
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

    @objc func handleShowProfilePress() {
        if !validateAllFields() {
            return
        }
        let showProfileViewController = ShowProfileViewController()
        
        showProfileViewController.profileData = Profile(name: createProfileView.nameField.text!, 
                                                          email: createProfileView.emailField.text!, 
                                                          phoneType: selectedPhoneType, 
                                                          phoneNumber: createProfileView.phoneNumberField.text!, 
                                                          address: createProfileView.addressField.text!, 
                                                          cityState: createProfileView.cityStateField.text!, 
                                                          zip: createProfileView.zipField.text!)

        navigationController?.pushViewController(showProfileViewController, animated: true)
    }
    
}

extension CreateProfileViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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



