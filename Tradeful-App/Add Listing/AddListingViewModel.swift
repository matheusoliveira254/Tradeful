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
    
    func createListing(title: String, location: String, description: String, category: String, userUid: String) {
        if title != "" && location != "" && description != "" && category != "" && userUid != "" {
            let listing = Listing(title: title, description: description, category: category, userUid: userUid)
            service.saveListingToFirestore(with: listing, firestoreUid: userUid) { result in
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
