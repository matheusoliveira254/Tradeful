//
//  Listing.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/21/22.
//

import Foundation

struct TopLevelDictionary: Codable {
    let listings: [Listing]
    let listingCount: Int
}

struct Listing: Codable {
    let photo: String
    let title: String
    let location: String
    let category: String
    let description: String
}
