//
//  UIScreenEx.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

extension UIScreen {

  static var width: CGFloat {
    return UIScreen.main.bounds.width
  }

  static var height: CGFloat {
    return UIScreen.main.bounds.height
  }
  
  static var safeAreaBottom: CGFloat {
    return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
  }
}
