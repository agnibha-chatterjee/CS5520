//
//  User.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

struct User: Codable {
    let _id: String
    let __v: Int
    let name: String
    let email: String
    let password: String?
    
    init(_id: String, __v: Int, name: String, email: String, password: String? = nil) {
        self._id = _id
        self.__v = __v
        self.name = name
        self.email = email
        self.password = password
    }
}
