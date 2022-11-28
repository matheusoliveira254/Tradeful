//
//  CreateAccountViewController.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/23/22.
//

import UIKit

class CreateAccountViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var createAccountNameTextField: UITextField!
    @IBOutlet weak var createAccountLocationTextField: UITextField!
    @IBOutlet weak var createAccountEmailTextField: UITextField!
    @IBOutlet weak var createAccountNewPasswordTextField: UITextField!
    @IBOutlet weak var createAccountConfirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: - IBAction
    
    @IBAction func createAccountCreateButtonTapped(_ sender: UIBarButtonItem) {
    }
    
}
