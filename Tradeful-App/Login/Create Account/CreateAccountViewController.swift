//
//  CreateAccountViewController.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/23/22.
//

import UIKit
import FirebaseAuth

class CreateAccountViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var createAccountNameTextField: UITextField!
    @IBOutlet weak var createAccountLocationTextField: UITextField!
    @IBOutlet weak var createAccountEmailTextField: UITextField!
    @IBOutlet weak var createAccountPhoneNumberTextField: UITextField!
    @IBOutlet weak var createAccountNewPasswordTextField: UITextField!
    @IBOutlet weak var createAccountConfirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func signUp() {
        if createAccountNewPasswordTextField.text == createAccountConfirmPasswordTextField.text {
            if let name = createAccountNameTextField.text,
               let location = createAccountLocationTextField.text,
               let email = createAccountEmailTextField.text,
               let phoneNumber = createAccountPhoneNumberTextField.text,
               let password = createAccountNewPasswordTextField.text {
                FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                    if let error {
                        print(error)
                        return
                    }
                    
                    guard let user = authResult?.user else {return}
                    UserDefaults.standard.set(true, forKey: "signedInWithFirebase")
                    UserDefaults.standard.set(user.uid, forKey: "uid")
                    UserDefaults.standard.set(user.email, forKey: "email")
                    UserDefaults.standard.set(user.displayName, forKey: "name")
                    UserDefaults.standard.set(user.phoneNumber, forKey: "phone")
                    let storyboard = UIStoryboard(name: "HomeTab", bundle: nil)
                    guard let storyboardViewController = storyboard.instantiateViewController(withIdentifier: "home") as? HomeListingCollectionViewController else {return}
                    self?.navigationController?.pushViewController(storyboardViewController, animated: true)
                }
            } else {
                let missingFieldAlertController = UIAlertController(title: "Missing Field", message: "Please fill all required fields.", preferredStyle: .alert)
                let dismissAction = UIAlertAction(title: "Ok", style: .default)
                missingFieldAlertController.addAction(dismissAction)
                self.present(missingFieldAlertController, animated: true)
                return
            }
        } else {
            let passwordNotMatchingAlertController = UIAlertController(title: "Password are not matching!", message: "Please make sure passwords match.", preferredStyle: .alert)
            let passwordDismissAction = UIAlertAction(title: "Ok", style: .default)
            passwordNotMatchingAlertController.addAction(passwordDismissAction)
            self.present(passwordNotMatchingAlertController, animated: true)
            return
        }
    }

    //MARK: - IBAction
    
    @IBAction func createAccountCreateButtonTapped(_ sender: UIBarButtonItem) {
        signUp()
    }
}
