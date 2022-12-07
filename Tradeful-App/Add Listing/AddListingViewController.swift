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
    
    var category: String {
        switch addListingCategorySegmentedControl.selectedSegmentIndex {
        case 0:
            return "Home"
        case 1:
            return "Sporting"
        case 2:
            return "Electronics"
        case 3:
            return "Vehicles"
        default:
            return "Other"
        }
    }
    
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
        
//        guard let
    }
}//End of class

extension AddListingViewController: AddListingsViewModelDelegate {
    func postedListingSuccessfully() {
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
