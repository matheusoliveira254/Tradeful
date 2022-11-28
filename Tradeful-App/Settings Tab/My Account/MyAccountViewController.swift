//
//  MyAccountViewController.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/23/22.
//

import UIKit

class MyAccountViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var myAccountNameTextField: UITextField!
    @IBOutlet weak var myAccountLocationTextField: UITextField!
    @IBOutlet weak var myAccountEmailTextField: UITextField!
    @IBOutlet weak var myAccountNewPasswordTextField: UITextField!
    @IBOutlet weak var myAccountConfirmPasswordTextField: UITextField!
    
    
    
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
    @IBAction func myAccountUpdateBarButton(_ sender: UIBarButtonItem) {
    }
}
