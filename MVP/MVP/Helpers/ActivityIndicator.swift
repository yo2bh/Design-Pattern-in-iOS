//
//  ActivityIndicator.swift
//  MVP
//
//  Created by Yogesh Bharate on 2/10/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
  convenience init(activityIndicatorStyle: UIActivityIndicatorViewStyle, color: UIColor, placeInTheCenterOf parentView: UIView) {
    self.init(activityIndicatorStyle: activityIndicatorStyle)
    center = parentView.center
    self.color = color
    parentView.addSubview(self)
  }
}
