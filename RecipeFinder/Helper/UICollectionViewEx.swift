//
//  UICollectionViewEx.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

extension UICollectionView {
  
  func registerCellClass<T: BaseCollectionViewCell>(_ type: T.Type) {
    self.register(UINib(nibName: type.nibName, bundle: nil), forCellWithReuseIdentifier: type.identifier)
  }
  
}
