//
//  Constants.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/19/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import Foundation

struct Constants {
    static let requestURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/new-releases/all/100/explicit.json"
    static let cellIdentifier = "NewReleaseCell"
    static let results = "results"
    static let artistNameKey = "artistName"
    static let albumNameKey = "name"
    static let releaseDateKey = "releaseDate"
    static let imageURLKey = "artworkUrl100"
    static let feedKey = "feed"
    static let OkButtonTitle = "OK"
    static let error = "Error"
    static let emptyString = ""
}
