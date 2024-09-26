//
//  ViewController.swift
//  WA3_Chatterjee_5185
//
//  Created by agni on 9/25/24.
//

import UIKit

class CreateProfileViewController: UIViewController {
    
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
    
    @objc func handleShowProfilePress() {
        let showProfileViewController = ShowProfileViewController()
        navigationController?.pushViewController(showProfileViewController, animated: true)
        print("Navigated")
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

