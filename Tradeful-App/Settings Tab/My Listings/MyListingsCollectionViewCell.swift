//
//  MyListingsCollectionViewCell.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/23/22.
//

import UIKit

class MyListingsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myListingTitleLabel: UILabel!
    @IBOutlet weak var myListingsDateLabel: UILabel!
    @IBOutlet weak var myListingsImageImageView: UIImageView!
    @IBOutlet weak var myListingsPageControl: UIPageControl!
    @IBOutlet weak var myListingsFavoriteButton: UIButton!
    @IBOutlet weak var myListingsLocationLabel: UILabel!
    @IBOutlet weak var myListingsCategoryLabel: UILabel!
    @IBOutlet weak var myListingsContactNameLabel: UILabel!
    @IBOutlet weak var myListingsDescriptionLabel: UILabel!
    
    //MARK: - IBActions
    @IBAction func myListingsFavoriteButtonTapped(_ sender: UIButton) {
    }
    @IBAction func myListingsContactPhoneButtonTapped(_ sender: UIButton) {
    }
    @IBAction func myListingsContactEmailButtonTapped(_ sender: UIButton) {
    }
}
