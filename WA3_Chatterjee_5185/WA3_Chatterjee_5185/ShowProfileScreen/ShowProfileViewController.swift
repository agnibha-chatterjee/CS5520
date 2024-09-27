//
//  ShowProfileViewController.swift
//  WA3_Chatterjee_5185
//
//  Created by agni on 9/26/24.
//

import UIKit

class ShowProfileViewController: UIViewController {
    
    let showProfileView = ShowProfileView()
    var profileData: CreateProfileViewController.Profile?


    
    override func loadView() {
        view = showProfileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        displayProfileData()
        showPhoneTypeImage()
    }

    func displayProfileData() {
        showProfileView.nameLabel.text! += " \(profileData!.name)"
        showProfileView.emailLabel.text! += " \(profileData!.email)"
        showProfileView.phoneLabel.text! += " \(profileData!.phoneNumber) (\(profileData!.phoneType))"
        showProfileView.addressLabel.text! += " \(profileData!.address)"
        showProfileView.cityStateLabel.text! += profileData!.cityState
        showProfileView.zipLabel.text! += " \(profileData!.zip)"
    }

    func showPhoneTypeImage() {
        showProfileView.phoneTypeImage.image = UIImage(named: profileData!.phoneType.lowercased())
    }

}
