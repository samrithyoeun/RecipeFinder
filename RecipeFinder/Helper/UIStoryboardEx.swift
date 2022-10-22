//
//  UIStoryboardEx.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

extension UIStoryboard {
  
  static func instantiate<T>(_ type: T.Type, id: String, storyboardName: String = "Main") -> T {
    let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
    let viewController = storyBoard.instantiateViewController(withIdentifier: id) as! T
    return viewController
  }
}
