//
//  TastyAPIService.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import Foundation
import Moya

class TastyAPIService {

  private let provider = MoyaProvider<TastyAPI>()
  
  func getList(from: Int, size: Int, completion: @escaping (Result<[Recipe], Error>) -> Void) {
      provider.request(.list(from: from, size: size)) { result in
        switch result {
        case .success(let response):
          if let result = try? response.map(List.self), let recipes = result.recipes {
            completion(.success(recipes))
          }
          
        case .failure(let error):
          completion(.failure(error))
        }
      }
  }
   
}
