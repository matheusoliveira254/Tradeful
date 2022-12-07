//
//  Listing.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/21/22.
//

import Foundation

class Listing {
    
    enum Key {
        static let listing = "listings"
        static let title = "title"
        static let location = "location"
        static let listingsPhotos = "photos"
        static let userName = "userName"
        static let email = "email"
        static let phoneNumber = "phone"
        static let description = "description"
        static let date = "date"
        static let category = "category"
        static let uuid = "uuid"
    }
    
    var title: String
    var location: String
    var listingsPhotos: [String]
    var userName: String
    var email: String
    var phoneNumber: String
    var description: String
    var date: Date
    var category: String
    var uuid: String
    
    var listingData: [String:AnyHashable] {
        [Key.title: self.title,
         Key.location: self.location,
         Key.listingsPhotos: self.listingsPhotos,
         Key.userName: self.userName,
         Key.email: self.email,
         Key.phoneNumber: self.phoneNumber,
         Key.description: self.description,
         Key.date: self.date,
         Key.category: self.category,
         Key.uuid: self.uuid]
    }
    
    init(title: String, location: String, listingsPhotos: [String], userName: String, email: String, phoneNumber: String, description: String, date: Date = Date(), category: String, uuid: String) {
        self.title = title
        self.location = location
        self.listingsPhotos = listingsPhotos
        self.userName = userName
        self.email = email
        self.phoneNumber = phoneNumber
        self.description = description
        self.date = date
        self.category = category
        self.uuid = uuid
    }
}//End of struct
