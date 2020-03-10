//
//  ViewController.swift
//  MVP
//
//  Created by Yogesh Bharate on 2/10/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import UIKit

protocol MusicListViewDelegate {
  func displayMusicList(_ musicList: [MusicAlbumModel])
}

class MusicListViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet weak var musicAlbumTableView: UITableView!
  
  // MARK: - Variables
  var musicAlbums = [MusicAlbumModel]()
  var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Delegates
  let musicPresenter = MusicListPresenter()

  // MARK: - Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    musicPresenter.musicListDelegate = self
    if #available(iOS 13.0, *) {
      activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .large, color: .black, placeInTheCenterOf: self.view)
    } else {
      activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge, color: .black, placeInTheCenterOf: self.view)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    musicAlbumTableView.isHidden = true
    activityIndicator.startAnimating()
    musicPresenter.getMusicAlbumList()
  }
}

// MARK: - TableView Delegate Methods
extension MusicListViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return musicAlbums.count
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 90.0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MusicTableViewCell
    cell.configureCell(musicAlbum: musicAlbums[indexPath.row])
    
    return cell
  }
}

// MARK: - MusicListViewDelegate Methods
extension MusicListViewController: MusicListViewDelegate {
  func displayMusicList(_ musicList: [MusicAlbumModel]) {
    DispatchQueue.main.async { [weak self] in
      self?.activityIndicator.stopAnimating()
      self?.musicAlbums = musicList
      self?.musicAlbumTableView.reloadData()
      self?.musicAlbumTableView.isHidden = false
    }
  }
}

