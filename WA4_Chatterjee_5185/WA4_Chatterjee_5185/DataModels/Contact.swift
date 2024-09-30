//
//  Contact.swift
//  WA4_Chatterjee_5185
//
//  Created by agni on 9/29/24.
//

import Foundation

struct Contact {
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
