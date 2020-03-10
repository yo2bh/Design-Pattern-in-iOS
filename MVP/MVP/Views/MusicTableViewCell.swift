//
//  MusicTableViewCell.swift
//  MVP
//
//  Created by Yogesh Bharate on 2/10/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
  
  @IBOutlet weak var musicAlbumImageView: UIImageView!
  @IBOutlet weak var musicAlbumNameLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    configureMusicAlbumCell()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func configureMusicAlbumCell() {
    musicAlbumImageView.layer.cornerRadius = 15.0
    musicAlbumImageView.layer.borderWidth = 2.0
    musicAlbumImageView.layer.borderColor = UIColor.black.cgColor
  }
  
  func configureCell(musicAlbum: MusicAlbumModel) {
      musicAlbumNameLabel.text = musicAlbum.artistName
      setAlbumImage(musicAlbum.albumImageURL)
  }
  
  func setAlbumImage(_ urlString: String) {
    guard let url = URL(string: urlString) else {
      print("Invalid URL String")
      return
    }
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        DispatchQueue.main.async {
          self?.musicAlbumImageView.image = UIImage(data: data)
        }
      } else {
        print("Error in downloading image from \(urlString)\n")
      }
    }
  }
}
