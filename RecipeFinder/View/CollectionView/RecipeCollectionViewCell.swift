//
//  RecipeCollectionViewCell.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit
import Kingfisher

class RecipeCollectionViewCell: BaseCollectionViewCell {
  
  @IBOutlet private weak var thumbNailImageView: UIImageView?
  @IBOutlet private weak var recipeNameLabel: UILabel?
  @IBOutlet private weak var containerView: UIView?
  @IBOutlet private weak var shadowView: UIView?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  func setup() {
    containerView?.clipsToBounds = true
    containerView?.layer.cornerRadius = 10
    containerView?.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
    containerView?.layer.borderWidth = 0.1

    shadowView?.dropShadowWithCornerRadius(corner: 10)
  }
  
  func bind(model: Recipe) {
    thumbNailImageView?.loadImageFrom(urlString: model.thumbnailURL)
    recipeNameLabel?.text = model.name
  }
  
}
