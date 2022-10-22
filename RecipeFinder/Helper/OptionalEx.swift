//
//  OptionalEx.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import Foundation

extension Optional where Wrapped == String {
  
  var orEmpty: String {
    switch self {
    case .some(let value):
      return value
      
    default:
      return ""
    }
  }
  
}

extension Optional where Wrapped == Int {
  
  var orEmpty: Int {
    switch self {
    case .some(let value):
      return value
      
    default:
      return 0
    }
  }
  
}
