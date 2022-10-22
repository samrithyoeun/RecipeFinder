//
//  UIViewEx.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

extension UIView {
  
  func dropShadowWithCornerRadius(corner: CGFloat, color: UIColor = .gray, opacity: Float = 0.75, radius: CGFloat = 3) {
    layer.masksToBounds = false
    layer.cornerRadius = corner
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
    layer.shadowRadius = radius
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale
  }
  
}
