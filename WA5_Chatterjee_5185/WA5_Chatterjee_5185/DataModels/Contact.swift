//
//  Contact.swift
//  WA5_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import Foundation
import UIKit

struct Contact {
    var name: String
    var photo: UIImage
    var email: String
    var phoneType: String
    var phoneNumber: Int
    var address: String
    var cityState: String
    var zip: Int

    init(name: String, photo: UIImage, email: String, phoneType: String, phoneNumber: Int, address: String, cityState: String, zip: Int) {
        self.name = name
        self.photo = photo
        self.email = email
        self.phoneType = phoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.cityState = cityState
        self.zip = zip
    }
}
