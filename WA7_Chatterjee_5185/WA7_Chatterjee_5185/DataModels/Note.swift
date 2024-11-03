//
//  Note.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Foundation

struct Note: Codable {
    var _id: String
    var text: String
    var userId: String
    var __v: Int
   
    
    init(_id: String, text: String, __v: Int, userId: String) {
        self._id = _id
        self.text = text
        self.__v = __v
        self.userId = userId
    }
}


