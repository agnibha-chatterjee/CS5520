//
//  CreateContactViewController.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import UIKit
import PhotosUI


class CreateContactViewController: UIViewController {
    
    let createContactView = CreateContactView()
    
    let phoneTypes = ["Cell", "Work", "Home"]
    var selectedPhoneType = "Home"
    var pickedImage: UIImage? = nil
    
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
    
        title = "Add Contact"
        createContactView.photoPickerBtn.menu = imagePickerMenu()
        createContactView.phoneNumberTypeBtn.menu = phoneTypePickerMenu()
        
        createContactView.saveBtn.addTarget(self, action: #selector(onSaveBtnTapped), for: .touchUpInside)
        
    }
    
    func phoneTypePickerMenu() -> UIMenu {
        var menuItems: [UIAction] = []
        for type in self.phoneTypes {
            menuItems.append(UIAction(title: type, handler: {(_) in
                self.changePhoneTypeBtn(type)
            }))
        }
        return UIMenu(title: "Select Label", children: menuItems)
    }
    
    func changePhoneTypeBtn(_ type: String) {
        self.selectedPhoneType = type
        createContactView.phoneNumberTypeBtn.setTitle(type, for: .normal)
    }
    
    func imagePickerMenu() -> UIMenu {
        let menuItems = [
            UIAction(title: "Camera", handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery", handler: {(_) in
                self.pickPhotoFromGallery()
            }),
        ]
           
        return UIMenu(title: "Select source", children: menuItems)
    }
       
    func pickUsingCamera() {
           
    }
       
    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
                
        let photoPicker = PHPickerViewController(configuration: configuration)
                
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    @objc func onSaveBtnTapped() {
        if !validateAllFields() {
            return
        }
        
        var photo: UIImage? = UIImage(systemName: "person.fill")
        
        if self.pickedImage != nil {
            photo = self.pickedImage
        }
    
        let newContact = Contact(name: createContactView.nameField.text!,
                                 photo: photo!,
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

extension CreateContactViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
    
        let itemProvider = results.map(\.itemProvider)
        
        for item in itemProvider {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.createContactView.photoPickerBtn.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}


