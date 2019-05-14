//
//  ViewController.swift
//  MVVM
//
//  Created by Yogesh Bharate on 4/15/19.
//  Copyright © 2019 Bharate, Yogesh. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
  
  var musicModel = [Artists]()
  fileprivate var mainViewModel = MainViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.mainViewModel.getArtists(success: gotResponse(_:), failure: gotFailure(_:))
    print("Appear")
  }
  
  func gotResponse(_ response: [Artists]) {
    DispatchQueue.main.async {[weak self] in
      self?.musicModel = response
      self?.tableView.reloadData()
    }
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print("Disappear")
  }
  
  func gotFailure(_ error: String) {
    print(error)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return musicModel.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier) as! CustomTableViewCell
    cell.artistTitle.text = musicModel[indexPath.row].artistName
    let imageUrl = musicModel[indexPath.row].artistUrl
    cell.artistImage.downloadImageFrom(link: imageUrl, contentMode: .scaleAspectFit)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80.0
  }
  
  deinit {
    print("Deinit called")
  }
}

extension UIImageView {
  func downloadImageFrom(link:String, contentMode: UIView.ContentMode) {
    URLSession.shared.dataTask(with: URL(string:link)!, completionHandler: {
      (data, response, error) -> Void in
      DispatchQueue.main.async {
        self.contentMode =  contentMode
        if let data = data { self.image = UIImage(data: data) }
      }
    }).resume()
  }
}
