//
//  ListViewController+Extension.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/20/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import Foundation

extension ListViewController {    
    func getNewReleaseAlbum() {
        NetworkManager.sendRequest(requestURL: Constants.requestURL, completionHandler: { [weak self] data, error in
            if let data = data {
                let musicAlbum = Parser.shared.parseResponse(response: data)
                self?.reloadTableView(musicAlbums: musicAlbum)
            } else if let error = error {
                AlertView.show(title: Constants.error, message: error.localizedDescription)
            }
        })
    }
}
