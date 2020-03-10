//
//  NetworkManager.swift
//  MVP
//
//  Created by Yogesh Bharate on 2/10/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import UIKit

class NetworkManager {
  
  static let shared = NetworkManager()
  
   func sendRequest(requestURL: String, completionHandler: @escaping (Data?, Error?) -> Void) {
    // Create URL from string
    let url = URL(string: requestURL)!
    // Create the session object
    let session = URLSession.shared
    // Create url request
    let request = URLRequest(url: url)
    // Create dataTask using session object to send data to the server
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    let task = session.dataTask(with: request, completionHandler: { data, response, error in
      DispatchQueue.main.async {
       UIApplication.shared.isNetworkActivityIndicatorVisible = false
      }
      if let data = data {
        completionHandler(data, nil)
      } else if let error = error {
        completionHandler(nil, error)
      }
    })
    task.resume()
  }
}
