//
//  ViewController.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/19/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Variables
    var availableMusicAlbums = [MusicModel]()
    var activityIndicator: UIActivityIndicatorView!
    
    // MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
         activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge, color: .gray, placeInTheCenterOf: view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        activityIndicator.startAnimating()
        getNewReleaseAlbum()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func reloadTableView(musicAlbums: [MusicModel]) {
        self.availableMusicAlbums = musicAlbums
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}

// MARK: - UITableView Delegate method
extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableMusicAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! MusicListTableViewCell
        cell.configureCell(musicAlbum: availableMusicAlbums[indexPath.row])
        
        return cell
    }
}

