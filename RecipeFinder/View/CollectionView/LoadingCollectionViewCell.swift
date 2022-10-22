//
//  LoadingCollectionViewCell.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

class LoadingCollectionViewCell: BaseCollectionViewCell {
  
  @IBOutlet weak var indicator: UIActivityIndicatorView?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    indicator?.startAnimating()
  }
  
  func stopDisplaying() {
    indicator?.isHidden = true
  }
  
}

