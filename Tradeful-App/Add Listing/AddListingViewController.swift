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
    @IBOutlet weak var addListingPhotosCollectionView: UICollectionView!
    
    private var viewModel: AddListingsViewModel!
    
    var category: String? {
        switch addListingCategorySegmentedControl.selectedSegmentIndex {
        case 0:
            return "Home"
        case 1:
            return "Sporting"
        case 2:
            return "Electronics"
        case 3:
            return "Vehicles"
        case 4:
            return "Other"
        default:
            return "Home"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddListingsViewModel(delegate: self)
//        addListingPhotosCollectionView.delegate = self
//        addListingPhotosCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        
        guard let title = addListingTitleTextField.text,
              let location = addListingLocationTextField.text,
              let category = category,
              let description = addListingDescriptionTextView.text else {return}
        
        viewModel.createListing(title: title, location: location, description: description, category: category, userUid: UserDefaults.standard.value(forKey: "uid") as! String)
        
        postedListingSuccessfully()
    }
}//End of class

//extension AddListingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addListingPhotoCell", for: indexPath) as? UIColle
//
//        return cell
//    }
//}

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
