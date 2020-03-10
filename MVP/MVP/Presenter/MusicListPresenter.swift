//
//  MusicListPresenter.swift
//  MVP
//
//  Created by Yogesh Bharate on 2/10/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import Foundation

class MusicListPresenter {
  
  // MARK: - Variables
  var musicListDelegate: MusicListViewDelegate?
  
  func getMusicAlbumList() {
    NetworkManager.shared.sendRequest(requestURL: Constants.requestURL) { (response, error) in
      guard let response = response, let data = try? JSONDecoder().decode(AlbumModel.self, from: response), error == nil else {
        print("error")
        return
      }
      var musicAlbums = [MusicAlbumModel]()
      for album in data.feed.results {
        musicAlbums.append(album)
      }
      self.musicListDelegate?.displayMusicList(musicAlbums)
      print(musicAlbums)
    }
  }
}
