//
//  MainViewModel.swift
//  MVVM
//
//  Created by Yogesh Bharate on 5/5/19.
//  Copyright © 2019 Bharate, Yogesh. All rights reserved.
//

import Foundation

class MainViewModel {
  func getArtists(success: @escaping([Artists]) -> Void, failure: @escaping(String) -> Void) {
    NetworkManager.shared.sendRequest(urlString: Constants.urlString, type: .Get, parameters: nil) { (data, error) in
      guard let data = data else {
        failure((error?.localizedDescription)!)
        return
      }
      
      guard let response = try? JSONDecoder().decode(MusicModel.self, from: data) else {
        print(Constants.decodeError)
        return
      }
      var artists = [Artists]()
      for artist in response.feed.results {
        artists.append(artist)
      }
      success(artists)
    }
  }
}
