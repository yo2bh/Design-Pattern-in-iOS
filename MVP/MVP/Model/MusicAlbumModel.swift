//
//  MusicAlbumModel.swift
//  MVP
//
//  Created by Yogesh Bharate on 2/10/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import Foundation

struct AlbumModel: Decodable {
  var feed: FeedResponse
  
  enum ModelCodingKeys: String, CodingKey {
    case feed = "feed"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ModelCodingKeys.self)
    feed = try container.decode(FeedResponse.self, forKey: .feed)
  }
}

struct FeedResponse: Decodable {
  var title: String
  var results: [MusicAlbumModel]
  
  enum ModelCodingKeys: String, CodingKey {
    case title = "title"
    case results = "results"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ModelCodingKeys.self)
    title = try container.decode(String.self, forKey: .title)
    results = try container.decode([MusicAlbumModel].self, forKey: .results)
  }
}

struct MusicAlbumModel: Decodable {
  var artistName: String
  var albumName: String
  var releaseDate: String
  var albumImageURL: String
  
  enum ModelCodingKeys: String, CodingKey {
    case artistName = "name"
    case albumName = "kind"
    case releaseDate = "id"
    case albumImageURL = "artworkUrl100"
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ModelCodingKeys.self)
    artistName = try container.decode(String.self, forKey: .artistName)
    albumName = try container.decode(String.self, forKey: .albumName)
    releaseDate = try container.decode(String.self, forKey: .releaseDate)
    albumImageURL = try container.decode(String.self, forKey: .albumImageURL)
  }
}
