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
        static let myListings = "myListings"
        static let favorites = "favorites"
        static let title = "title"
//        static let listingsPhotos = "photos"
        static let description = "description"
        static let date = "date"
        static let category = "category"
        static let userUid = "userUid"
        static let listingUid = "listingUid"
    }
    
    var title: String
//    var listingsPhotos: [String]
    var description: String
    var date: Date
    var category: String
    var userUid: String
    var listingUid = "listingUid"
    
    var listingData: [String:AnyHashable] {
        [Key.title: self.title,
//         Key.listingsPhotos: self.listingsPhotos,
         Key.description: self.description,
         Key.date: self.date,
         Key.category: self.category,
         Key.userUid: self.userUid,
         Key.listingUid: self.listingUid
        ]
    }
    
    init(title: String, description: String, date: Date = Date(), category: String, userUid: String, listingUid: String = UUID().uuidString) {
        self.title = title
//        self.listingsPhotos = listingsPhotos
        self.description = description
        self.date = date
        self.category = category
        self.userUid = userUid
        self.listingUid = listingUid
    }
}//End of struct
