//
//  UIImageViewEx.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit
import Kingfisher

extension UIImageView {
  
  func loadImageFrom(urlString: String?) {
    
    guard let urlString = urlString  else { return }
    
    let url = URL(string: urlString)
    
    kf.indicatorType = .activity
    
    kf.setImage(with: url,
                placeholder: UIImage(named: "recipe-cutlery"),
                
                options:  [
                  .processor(DownsamplingImageProcessor(size: self.bounds.size)),
                  .scaleFactor(UIScreen.main.scale),
                  .transition(.fade(0.5))
                ]
                
    )
    
  }
}
