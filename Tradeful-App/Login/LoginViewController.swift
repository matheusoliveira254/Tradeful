//
//  ViewController.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/14/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var loginScreenUsernameTextField: UITextField!
    @IBOutlet weak var loginScreenPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let handle = Auth.auth().addStateDidChangeListener { auth, user in
            
        }
    }
    
    //MARK: - IBAction
    @IBAction func loginScreenSignInButton(_ sender: UIButton) {
        if let email = loginScreenUsernameTextField.text,
           let password = loginScreenPasswordTextField.text {
            FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                switch result {
                case .none:
                    let alertController = UIAlertController(title: "Account not found", message: "Please check you email and password and try again.", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "Ok", style: .default)
                    alertController.addAction(confirmAction)
                    self?.present(alertController, animated: true)
                    
                case .some(let userDetails):
                    UserDefaults.standard.set(true, forKey: "signedInWithFirebase")
                    print("Signed in as", userDetails.user.email!)
                    UserDefaults.standard.set(userDetails.user.uid, forKey: "uid")
                    UserDefaults.standard.set(userDetails.user.email, forKey: "email")
                    let storyboard = UIStoryboard(name: "HomeTab", bundle: nil)
                    guard let storyboardViewController = storyboard.instantiateViewController(withIdentifier: "home") as? HomeListingCollectionViewController else {return}
                    self?.navigationController?.pushViewController(storyboardViewController, animated: true)
                }
            }
        }
    }
    
    @IBAction func loginScreenSingInWithAppleButton(_ sender: UIButton) {
    }
    @IBAction func loginScreenRegisterButton(_ sender: UIButton) {
    }
    
    
}

