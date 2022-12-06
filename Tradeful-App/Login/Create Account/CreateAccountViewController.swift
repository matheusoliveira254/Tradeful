//
//  CreateAccountViewController.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/23/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class CreateAccountViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var createAccountNameTextField: UITextField!
    @IBOutlet weak var createAccountLocationTextField: UITextField!
    @IBOutlet weak var createAccountEmailTextField: UITextField!
    @IBOutlet weak var createAccountPhoneNumberTextField: UITextField!
    @IBOutlet weak var createAccountNewPasswordTextField: UITextField!
    @IBOutlet weak var createAccountConfirmPasswordTextField: UITextField!
    
    private var viewModel: CreateAccountViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CreateAccountViewModel(delegate: self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    //MARK: - IBAction
    
    @IBAction func createAccountCreateButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let name = createAccountNameTextField.text,
              let location = createAccountLocationTextField.text,
              let email = createAccountEmailTextField.text,
              let phoneNumber = createAccountPhoneNumberTextField.text,
              let password = createAccountNewPasswordTextField.text,
              let confirmPassword = createAccountConfirmPasswordTextField.text else {return}
        
        if password == confirmPassword {
            viewModel.createUser(name: name, location: location, email: email, phoneNumber: phoneNumber, password: password)
        } else {
            let passwordNotMatchingAlertController = UIAlertController(title: "Password Invalid.", message: "Please make sure passwords match.", preferredStyle: .alert)
            let passwordDismissAction = UIAlertAction(title: "Ok", style: .default)
            passwordNotMatchingAlertController.addAction(passwordDismissAction)
            self.present(passwordNotMatchingAlertController, animated: true)
            return
        }
    }
}

extension CreateAccountViewController: CreateAccountViewModelDelegate {
    func userSignedIn() {
        let storyboard = UIStoryboard(name: "HomeTab", bundle: nil)
        guard let storyboardViewController = storyboard.instantiateViewController(withIdentifier: "home") as? HomeListingCollectionViewController else {return}
        self.navigationController?.pushViewController(storyboardViewController, animated: true)
    }
    
    func encountered(error: Error?) {
        let missingFieldAlertController = UIAlertController(title: "There was an error.", message: error?.localizedDescription.description ?? "Please make sure all required fields are filled properly.", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Ok", style: .default)
        missingFieldAlertController.addAction(dismissAction)
        self.present(missingFieldAlertController, animated: true)
    }
}
