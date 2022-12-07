//
//  FirebaseHelper.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 12/1/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
import Firebase

enum FirebaseError: Error {
    case firebaseError(Error)
    case failedToUnwrapData
    case noDataFound
}

protocol FirebaseSyncable {
    func saveUserToFirebase(with user: User, firestoreUid: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void)
    func createFirestoreUser(newUser: User, completion: @escaping (Result<Bool, FirebaseError>) -> Void)
    func deleteUser(user: User)
    func saveListingToFirestore(with listing: Listing, firestoreUid: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void)
}

struct FirebaseService: FirebaseSyncable {
    let ref = Firestore.firestore()
    
    //This is creating the user to Firebase but not saving the data
    func createFirestoreUser(newUser: User, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        Auth.auth().createUser(withEmail: newUser.email, password: newUser.password) { authResult, authError in
            if let authError {
                print(authError)
                completion(.failure(.firebaseError(authError)))
            }
            
            guard let firestoreUser = authResult?.user else {return}
            saveUserToFirebase(with: newUser, firestoreUid: firestoreUser.uid) { result in
                switch result {
                case .failure(let error):
                    print(error)
                    completion(.failure(.firebaseError(error)))
                case .success(let success):
                    UserDefaults.standard.set(true, forKey: "signedInWithFirebase")
                    UserDefaults.standard.set(firestoreUser.uid, forKey: "uid")
                    completion(.success(success))
                }
            }
        }
    }
    
    func saveUserToFirebase(with user: User, firestoreUid: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        ref.collection(User.Key.user).document(firestoreUid).setData(user.userData) { error in
            if let error = error {
                print(error)
                completion(.failure(.firebaseError(error)))
            }
            completion(.success(true))
        }
    }
    
    func deleteUser(user: User){
        ref.collection(User.Key.user).document(user.uuid).delete()
    }
    
    func saveListingToFirestore(with listing: Listing, firestoreUid: String, completion: @escaping (Result<Bool, FirebaseError>) -> Void) {
        ref.collection(Listing.Key.listing).document(firestoreUid).collection(Listing.Key.myListings).document(listing.title).setData(listing.listingData) { error in
            if let error = error {
                print(error)
                completion(.failure(.firebaseError(error)))
            }
            completion(.success(true))
        }
    }
}//End of struct
