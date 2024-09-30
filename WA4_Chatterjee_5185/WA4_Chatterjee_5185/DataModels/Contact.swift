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
    var phoneNumber: Int
    var address: String
    var cityState: String
    var zip: Int

    init(name: String, email: String, phoneType: String, phoneNumber: Int, address: String, cityState: String, zip: Int) {
        self.name = name
        self.email = email
        self.phoneType = phoneType
        self.phoneNumber = phoneNumber
        self.address = address
        self.cityState = cityState
        self.zip = zip
    }
}
