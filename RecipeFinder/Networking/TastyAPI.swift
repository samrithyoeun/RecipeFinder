//
//  TastyAPI.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import Foundation
import Moya

enum TastyAPI: TargetType {
  
  case list(from: Int, size: Int)
  
  var baseURL: URL {
    return URL(string: "https://tasty.p.rapidapi.com/")!
  }
  
  var path: String {
    switch self {
    case .list:
      return "recipes/list"
      
    default:
      break
    }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var headers: [String : String]? {
    return [
      "X-RapidAPI-Key": "a3e1c180e6mshc85ef90821277c9p1b5824jsn280053701676",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com"
    ]
    
  }
  
  var task: Task {
    switch self {
    case .list(let from, let size):
      var param = [String: Any]()
      param["from"] = from
      param["to"] = size
      return .requestParameters(parameters: param, encoding: URLEncoding.default)
      
    default:
      break
    }
  }
  
}

