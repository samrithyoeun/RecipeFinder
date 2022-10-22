//
//  List.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import Foundation

struct List: Codable {
  let count: Int?
  let recipes: [Recipe]?
  
  init(count: Int, results: [Recipe]) {
    self.count = count
    self.recipes = results
  }
  
  enum CodingKeys: String, CodingKey {
    case count
    case recipes = "results"
  }
}
