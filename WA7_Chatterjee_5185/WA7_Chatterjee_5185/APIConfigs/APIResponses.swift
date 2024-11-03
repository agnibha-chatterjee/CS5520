//
//  AuthAPIResponse.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Foundation

struct RegisterAPIResponse: Codable {
    var auth: Bool
    var token: String
    
    init(auth: Bool, token: String) {
        self.auth = auth
        self.token = token
    }
}

struct LoginAPIResponse: Codable {
    var auth: Bool
    var token: String
    
    init(auth: Bool, token: String) {
        self.auth = auth
        self.token = token
    }
}

struct GetAllNotesResponse: Codable {
    var notes: [Note]
    
    init(notes: [Note]) {
        self.notes = notes
    }
}
