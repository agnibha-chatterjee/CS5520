//
//  AuthAPI.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Foundation

protocol AuthAPIProtocol{
    func register(_ newUser: User)
    func login(email: String, password: String)
    func getUserDetails(token: String)
}

