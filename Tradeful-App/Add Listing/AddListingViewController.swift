//
//  AddListingViewController.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/21/22.
//

import UIKit
import FirebaseAuth

class AddListingViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var addListingTitleTextField: UITextField!
    @IBOutlet weak var addListingLocationTextField: UITextField!
    @IBOutlet weak var addListingCategorySegmentedControl: UISegmentedControl!
    @IBOutlet weak var addListingDescriptionTextView: UITextView!
    
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
    
    //MARK: - IBAction
    @IBAction func addListingButtonTapped(_ sender: UIBarButtonItem) {
    }
}
