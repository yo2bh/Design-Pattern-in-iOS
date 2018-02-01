//
//  NetworkManager.swift
//  MVC
//
//  Created by Yogesh Bharate on 1/19/18.
//  Copyright © 2018 Bharate, Yogesh. All rights reserved.
//

import Foundation

class NetworkManager {
    static func sendRequest(requestURL: String, completionHandler: @escaping ([String: Any]?, Error?) -> Void) {
        // Create URL from string
        let url = URL(string: requestURL)!
        // Create the session object
        let session = URLSession.shared
        // Create url request
        let request = URLRequest(url: url)
        // Create dataTask using session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            do {
                // Create json object from data
                if let responseData = data,
                     let json = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        completionHandler(json, nil)
                }
                completionHandler(nil, error)
            } catch let error {
                completionHandler(nil, error)
                print(error.localizedDescription)
            }
        })
        
        task.resume()
    }
}
