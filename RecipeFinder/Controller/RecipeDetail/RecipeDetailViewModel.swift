//
//  RecipeDetailViewModel.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import Foundation

class RecipeDetailViewModel {
  
  private var recipe: Recipe
  
  init(_ recipe: Recipe) {
    self.recipe = recipe
  }
  
  func getInstructions() -> String {
    return recipe
      .instructions?
      .sorted(by: { $0.position.orEmpty < $1.position.orEmpty })
      .reduce(into: "", { partialResult, instruction in
        partialResult.append(instruction.displayText.orEmpty + "\n\n")
      }) ?? ""
  }
  
  func getIngredient() -> String {
    
    var sectionsText = ""
    recipe.sections?.forEach({ section in
      let components = section.components?.sorted(by: { $0.position.orEmpty < $1.position.orEmpty })
      
      var string = ""
      components?.forEach {
        string.append("\($0.description)\n\n")
      }
      
      sectionsText.append(string)
    })
    return sectionsText
  }
  
  func getVideoUrl() -> String {
    return recipe.videoURL.orEmpty
  }
  
  func getThumbnailUrl() -> String {
    return recipe.thumbnailURL.orEmpty
  }
  
  func getRecipeName() -> String {
    return recipe.name.orEmpty
  }
  
}
