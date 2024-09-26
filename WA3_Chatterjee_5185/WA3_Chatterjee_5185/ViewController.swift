//
//  ViewController.swift
//  WA3_Chatterjee_5185
//
//  Created by agni on 9/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    let createProfileScreen = CreateProfileScreen()

    let phoneTypes = ["Cell", "Home", "Work"]
    var selectedPhoneType = "Cell"
    
    override func loadView() {
        view = createProfileScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createProfileScreen.phoneTypePicker.delegate = self
        createProfileScreen.phoneTypePicker.dataSource = self
        
        createProfileScreen.showProfileButton.addTarget(self, action: #selector(handleShowProfilePress), for: .touchUpInside)
    }
    
    @objc func handleShowProfilePress() {
        print("Agni")
    }

}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
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

//  class ViewController: UIViewController {
    
//     //codes omitted...

// }

// //MARK: implementing mood PickerView...
// extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
//     //returns the number of columns/components in the Picker View...
//     func numberOfComponents(in pickerView: UIPickerView) -> Int {
//         return 1
//     }
    
//     //returns the number of rows in the current component...
//     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//         return moods.count
//     }
    
//     //set the title of currently picked row...
//     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//         // on change selection, update selectedMood...
//         selectedMood = moods[row]
//         return moods[row]
//     }
// }
