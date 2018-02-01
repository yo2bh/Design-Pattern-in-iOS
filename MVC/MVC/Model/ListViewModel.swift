//
//  ListViewModel.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/19/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import Foundation

public struct MusicModel {
    var artistName: String
    var albumName: String
    var releaseDate: String
    var albumImageURL: String
    
    init(artistName: String, albumName: String, releaseDate: String, albumImageURL: String) {
        self.artistName = artistName
        self.albumName = albumName
        self.releaseDate = releaseDate
        self.albumImageURL = albumImageURL
    }
}

