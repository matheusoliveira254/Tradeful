//
//  CreateAccountViewModel.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/23/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

protocol CreateAccountViewModelDelegate: AnyObject {
    func encountered(error: Error?)
    func userSignedIn()
}

class CreateAccountViewModel {
    
    private weak var delegate: CreateAccountViewModelDelegate?
    private let service: FirebaseSyncable
    
    init(delegate: CreateAccountViewModelDelegate, service: FirebaseSyncable = FirebaseService()) {
        self.delegate = delegate
        self.service = service
    }
    
    //create a user and store user input into a user object
    func createUser(name: String, location: String, email: String, phoneNumber: String, password: String) {
        if name != "" && location != "" && email != "" && phoneNumber != "" && password != "" {
            let user = User(name: name, location: location, email: email, phoneNumber: phoneNumber, password: password)
            service.createFirestoreUser(newUser: user) { result in
                switch result {
                case .failure(let error):
                    self.delegate?.encountered(error: error)
                case .success(let _):
                    self.delegate?.userSignedIn()
                }
            }
        } else {
            self.delegate?.encountered(error: nil)
        }
    }
}//End of class
