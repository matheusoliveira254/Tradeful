//
//  User.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/30/22.
//

import Foundation

class User {
    
    enum Key {
        static let user = "users"
        static let name = "name"
        static let location = "location"
        static let email = "email"
        static let phoneNumber = "phone"
        static let password = "password"
        static let uuid = "uuid"
    }
    
    var name: String
    var location: String
    var email: String
    var phoneNumber: String
    var password: String
    var uuid: String
    
    var userData: [String:AnyHashable] {
        [Key.name: self.name,
         Key.location: self.location,
         Key.email: self.email,
         Key.phoneNumber: self.phoneNumber,
         Key.password: self.password,
         Key.uuid: self.uuid]
    }
    
    init(name: String, location: String, email: String, phoneNumber: String, password: String, uuid: String = UUID().uuidString) {
        self.name = name
        self.location = location
        self.email = email
        self.phoneNumber = phoneNumber
        self.password = password
        self.uuid = uuid
    }
}//End of struct
