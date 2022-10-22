//
//  Helper.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import UIKit

typealias Action = () -> Void

func showAlert(in controller: UIViewController?, message: String) {
  let alert = UIAlertController(title: nil,
                                message: message,
                                preferredStyle: .alert)
  
  alert.addAction(UIAlertAction(title: "OK",
                                style: .default,
                                handler: nil))
  
  controller?.present(alert, animated: true, completion: nil)
  
}
