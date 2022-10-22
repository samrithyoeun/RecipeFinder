//
//  RecipeCollectionViewFlowLayout.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

class RecipeCollectionViewFlowLayout: UICollectionViewFlowLayout {
  
  override init() {
    super.init()
    scrollDirection = .vertical
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}
