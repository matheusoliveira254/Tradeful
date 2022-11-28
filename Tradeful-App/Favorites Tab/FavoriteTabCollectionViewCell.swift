//
//  FavoriteTabCollectionViewCell.swift
//  Tradeful-App
//
//  Created by Matheus Oliveira on 11/21/22.
//

import UIKit

class FavoriteTabCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var favoriteListingTitleLabel: UILabel!
    @IBOutlet weak var favoriteListingDateLabel: UILabel!
    @IBOutlet weak var favoriteListingImageImageView: UIImageView!
    @IBOutlet weak var favoriteTabSaveButton: UIButton!
    @IBOutlet weak var favoriteTabPageControl: UIPageControl!
    @IBOutlet weak var favoriteTabLocationLabel: UILabel!
    @IBOutlet weak var favoriteTabCategoryLabel: UILabel!
    @IBOutlet weak var favoriteTabContactNameLabel: UILabel!
    @IBOutlet weak var FavoriteTabDescriptionLabel: UILabel!
    
    //MARK: - IBAction
    
    @IBOutlet weak var favoriteTabSaveButtonTapped: UIButton!
    @IBOutlet weak var favoriteTabContactNumberButtonTapped: UIButton!
    @IBOutlet weak var favoriteTabContactEmailButtonTapped: UIButton!
}
