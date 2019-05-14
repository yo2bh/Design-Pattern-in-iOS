//
//  NetworkManager.swift
//  MVVM
//
//  Created by Yogesh Bharate on 5/5/19.
//  Copyright © 2019 Bharate, Yogesh. All rights reserved.
//

import Foundation
import UIKit

enum RequestType: String {
  case Post = "POST"
  case Get = "GET"
  case Put = "PUT"
}

class NetworkManager {
  static let shared = NetworkManager()
  
  private init() {
    print("Initalized the network manager instance")
  }
  
  func sendRequest(urlString: String, type: RequestType, parameters: [String :Any]?, completionHandler: @escaping(Data?, Error?) -> Void) {
    // 1. Make URL from UrlString
    let url = URL(string: urlString)
    // 2. Create the URLRequest object
    var urlRequest = URLRequest(url: url!)
    // 3. Set httpMethod like POST, GET etc
    urlRequest.httpMethod = type.rawValue
    // 4. Add if any parameter
//    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    urlRequest.addValue("1", forHTTPHeaderField: "value")
    // 5. Create http body if have
//    do {
//      urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//    } catch let error {
//      completionHandler(nil, error)
//    }
    // 6. Send request - dataTask
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      DispatchQueue.main.async {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
      }
      completionHandler(data, error)
    }.resume()
  }
}
