//
//  AlertView.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/20/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import UIKit

class AlertView {
    
    static func show(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OkButton = UIAlertAction(title: Constants.OkButtonTitle, style: .cancel, handler: nil)
        
        alert.addAction(OkButton)
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
