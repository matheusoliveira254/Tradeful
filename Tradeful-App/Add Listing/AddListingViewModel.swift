//
//  AddListingViewModel.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/21/22.
//

import Foundation

protocol AddListingsViewModelDelegate: AnyObject {
    func encountered(error: Error?)
    func postedListingSuccessfully()
}

class AddListingsViewModel {
    
    private let service: FirebaseSyncable
    private let delegate: AddListingsViewModelDelegate?
    
    init(delegate: AddListingsViewModelDelegate, service: FirebaseSyncable = FirebaseService()) {
        self.delegate = delegate
        self.service = service
    }
    
    func createListing(title: String, location: String, listingsPhotos: [String], userName: String, email: String, phoneNumber: String, description: String, category: String, uuid: String) {
        if title != "" && location != "" && userName != "" && email != "" && phoneNumber != "" && description != "" && category != "" && uuid != "" {
            let listing = Listing(title: title, location: location, listingsPhotos: listingsPhotos, userName: userName, email: email, phoneNumber: phoneNumber, description: description, category: category, uuid: uuid)
            service.saveListingToFirestore(with: listing, firestoreUid: UserDefaults.standard.value(forKey: "uid") as! String) { result in
                switch result {
                case .failure(let error):
                    self.delegate?.encountered(error: error)
                case .success(let _):
                    self.delegate?.postedListingSuccessfully()
                }
            }
        } else {
            self.delegate?.encountered(error: nil)
        }
    }
}//End of class
