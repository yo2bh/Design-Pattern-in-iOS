//
//  CustomTableViewCell.swift
//  MVVM
//
//  Created by Yogesh Bharate on 5/5/19.
//  Copyright © 2019 Bharate, Yogesh. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  @IBOutlet weak var artistTitle: UILabel!
  @IBOutlet weak var artistImage: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
}
