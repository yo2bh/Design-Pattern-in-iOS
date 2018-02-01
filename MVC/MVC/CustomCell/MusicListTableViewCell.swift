//
//  MusicListTableViewCell.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/19/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import UIKit

class MusicListTableViewCell: UITableViewCell {

    // MARK:- IBOutlets
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureAlbumImage()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureAlbumImage() {
        albumImage.layer.cornerRadius = 25.0
        albumImage.layer.borderWidth = 1.0
        albumImage.layer.borderColor = UIColor.black.cgColor
    }
    
    func configureCell(musicAlbum: MusicModel) {
        albumName.text = musicAlbum.albumName
        artistName.text = musicAlbum.artistName
        releaseDateLabel.text = musicAlbum.releaseDate
    }

}
