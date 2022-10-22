//
//  Recipe.swift
//  RecipeFinder
//
//  Created by Samrith Yoeun on 10/22/22.
//

import Foundation

struct Recipe: Codable {
  let videoURL: String?
  let tags: [Tag]?
  let sections: [Section]?
  let name: String?
  let resultDescription: String?
  let thumbnailURL: String?
  let totalTimeMinutes: Int?
  let id: Int?
  let instructions: [Instruction]?
  let aspectRatio: String?
  let credits: [Credit]?
  let canonicalID: String?
  let originalVideoURL: String?
  let yields: String?
  
  enum CodingKeys: String, CodingKey {
    case videoURL = "video_url"
    case tags = "tags"
    case sections = "sections"
    case name = "name"
    case resultDescription = "description"
    case thumbnailURL = "thumbnail_url"
    case totalTimeMinutes = "total_time_minutes"
    case id = "id"
    case instructions = "instructions"
    case aspectRatio = "aspect_ratio"
    case credits = "credits"
    case canonicalID = "canonical_id"
    case originalVideoURL = "original_video_url"
    case yields = "yields"
    
  }
}

// MARK: - Credit
struct Credit: Codable {
  let name: String?
  let type: String?
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case type = "type"
  }
}

// MARK: - Instruction
struct Instruction: Codable {
  let id: Int?
  let position: Int?
  let displayText: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case position = "position"
    case displayText = "display_text"
  }
}

// MARK: - Section
struct Section: Codable {
  let components: [Component]?
  
  enum CodingKeys: String, CodingKey {
    case components = "components"
  }
}

// MARK: - Component
struct Component: Codable {
  let extraComment: String?
  let position: Int?
  let rawText: String?
  
  var description: String {
    return rawText.orEmpty
  }
  
  enum CodingKeys: String, CodingKey {
    case extraComment = "extra_comment"
    case position = "position"
    case rawText = "raw_text"
  }
}

// MARK: - Tag
struct Tag: Codable {
  let id: Int?
  let displayName: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "id"
    case displayName = "display_name"
  }
}
