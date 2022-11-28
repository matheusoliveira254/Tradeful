//
//  HomeListingCollectionViewCell.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/22/22.
//

import UIKit

class HomeListingCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var homeListingTitleLabel: UILabel!
    @IBOutlet weak var homeListingDateLabel: UILabel!
    @IBOutlet weak var homeListingImageImageView: UIImageView!
    @IBOutlet weak var homeTabFavoriteButton: UIButton!
    @IBOutlet weak var homeTabPageControl: UIPageControl!
    @IBOutlet weak var homeTabListingLocationLabel: UILabel!
    @IBOutlet weak var homeTabCategoryLabel: UILabel!
    @IBOutlet weak var homeTabContactNameLabel: UILabel!
    @IBOutlet weak var homeTabDescriptionLabel: UILabel!

    //MARK: - IBAction
    
    @IBAction func homeTabFavoriteButtonTapped(_ sender: UIButton) {
    }
    @IBAction func homeTabContactPhoneButtonTapped(_ sender: UIButton) {
    }
    @IBAction func homeTabContactEmailButtonTapped(_ sender: UIButton) {
    }
}
