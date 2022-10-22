//
//  MainViewModel.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import Foundation

class MainViewModel {
  
  var isFetchingResult = false
  var dataSource = [Recipe]()
  var isAllDataLoaded = false
  
  private var service: TastyAPIService!
  private var fetchedCount =  0
  
  required init(service: TastyAPIService) {
    self.service = service
  }
  
  func getRecipes(next: Int, onSuccess: Action? = nil, onError: ((String)-> Void)? = nil) {
    isFetchingResult = true
    
    service.getList(from: fetchedCount, size: next) { [self] result in
      self.isFetchingResult = false
    
      switch result {
      
      case .success(let result):
        fetchedCount += result.count
        let displayAbleResult = result.filter {
          return ($0.sections?.count).orEmpty > 0 // Tasty API return some recipe that only contains the video , so we decided to discard them for this purpose
        }
        
        dataSource.append(contentsOf: displayAbleResult)
        
        if result.count == fetchedCount {
          isAllDataLoaded = true
        }
        
        onSuccess?()
        
      case .failure(let error):
        onError?(error.localizedDescription)
      }
    }
  }
  
}

