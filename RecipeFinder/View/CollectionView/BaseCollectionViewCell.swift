//
//  BaseCollectionViewCell.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/23/22.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
  
  static var identifier: String {
    return String(describing: self)
  }
  
  static var nibName: String {
    return String(describing: self)
  }
  
}
