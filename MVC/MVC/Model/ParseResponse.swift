//
//  ParseResponse.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/19/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import Foundation

class Parser {
    
    var musicModels = [MusicModel]()
    
    static let shared = Parser()
    
    func parseResponse(response: [String: Any]) -> [MusicModel] {
        if let feed = response[Constants.feedKey] as? [String: Any],
            let results = feed[Constants.results] as? [[String: Any]] {
            for result in results {
                if let artistName = result[Constants.artistNameKey] as? String,
                    let releaseDate = result[Constants.releaseDateKey] as? String,
                    let albumName = result[Constants.albumNameKey] as? String,
                    let imageURL = result[Constants.imageURLKey] as? String {
                    let musicModel = MusicModel(artistName: artistName,
                                                albumName: albumName,
                                                releaseDate: releaseDate,
                                                albumImageURL: imageURL)
                    musicModels.append(musicModel)
                }
            }
        }
        return musicModels
    }
}
