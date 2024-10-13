//
//  EditContactViewController.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 10/13/24.
//

import UIKit
import PhotosUI


class EditContactViewController: UIViewController {
    
    let editContactView = EditContactView()
    
    let phoneTypes = ["Home", "Work", "Cell"]
    var selectedPhoneType = "Home"
    var pickedImage: UIImage? = UIImage(systemName: "person.fill")
    
    var contact: Contact?
    
    var delegate: MainScreenViewController!
    
    override func loadView() {
        view = editContactView
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    
    }
    
    @objc func hideKeyboardOnTap(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Edit"
        editContactView.photoPickerBtn.menu = imagePickerMenu()
        editContactView.phoneNumberTypeBtn.menu = phoneTypePickerMenu()
        
        editContactView.saveBtn.addTarget(self, action: #selector(onSaveBtnTapped), for: .touchUpInside)
        
        populateFields()
        
    }
    
    func populateFields() {
        self.editContactView.nameField.text = contact!.name
        self.editContactView.photoPickerBtn.setImage(contact!.image, for: .normal)
        self.editContactView.emailField.text = contact!.email
        self.editContactView.phoneNumberField.text = "\(contact!.phoneNumber)"
        self.editContactView.phoneNumberTypeBtn.setTitle(contact!.phoneType, for: .normal)
        self.editContactView.addressField.text = contact!.address
        self.editContactView.cityStateField.text = contact!.cityState
        self.editContactView.zipField.text = "\(contact!.zip)"
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
        editContactView.phoneNumberTypeBtn.setTitle(type, for: .normal)
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
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
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
        
    
        let updatedContact = Contact(name: editContactView.nameField.text!,
                                 image: self.pickedImage!,
                                 email: editContactView.emailField.text!,
                                 phoneType: selectedPhoneType,
                                 phoneNumber: Int(editContactView.phoneNumberField.text!)!,
                                 address: editContactView.addressField.text!,
                                 cityState: editContactView.cityStateField.text!,
                                 zip: Int(editContactView.zipField.text!)!)
        
        
        self.delegate.delegateOnEditContact(updatedContact)
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
    
    func validateEmptyFields() -> Bool {
        if editContactView.nameField.text?.isEmpty == true {
            showAlert(message: "Name cannot be empty")
            return false
        } else if editContactView.emailField.text?.isEmpty == true {
            showAlert(message: "Email cannot be empty")
            return false
        } else if editContactView.phoneNumberField.text?.isEmpty == true {
            showAlert(message: "Phone cannot be empty")
            return false
        } else if editContactView.addressField.text?.isEmpty == true {
            showAlert(message: "Address cannot be empty")
            return false
        } else if editContactView.cityStateField.text?.isEmpty == true {
            showAlert(message: "City/State cannot be empty")
            return false
        } else if editContactView.zipField.text?.isEmpty == true {
            showAlert(message: "Zip cannot be empty")
            return false
        }
        return true
    }
    
    func validateEmail() -> Bool {
        let email = editContactView.emailField.text!
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

        if editContactView.phoneNumberField.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Phone number must contain only digits")
            return false
        } else if editContactView.phoneNumberField.text!.count != 10 {
            showAlert(message: "Phone number must be exactly 10 digits long")
            return false
        }
        return true
    }

    func validateCityState() -> Bool {
        let components = editContactView.cityStateField.text!.split(separator: ",").map { component in
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
        if editContactView.zipField.text?.rangeOfCharacter(from: digitsCharacterSet.inverted) != nil {
            showAlert(message: "Zip code must contain only digits")
            return false
        } else if editContactView.zipField.text?.count != 5 {
            showAlert(message: "Zip code must be exactly 5 digits long")
            return false
        } else if let zip = Int(editContactView.zipField.text!), zip < 1 || zip > 99950 {
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

extension EditContactViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
    
        let itemProvider = results.map(\.itemProvider)
        
        for item in itemProvider {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.editContactView.photoPickerBtn.setImage(
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

extension EditContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage {
            self.editContactView.photoPickerBtn.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        } else {
            // Image was not uploaded
        }
    }
}
