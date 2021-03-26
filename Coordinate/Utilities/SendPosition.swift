//
//  SendPosition.swift
//  Coordinate
//
//  Created by Michael Peters on 3/25/21.
//

import Foundation

func SendPosition(posData: OutboundCoordinate, theURL: String, theKey: String) -> Void {
    
    let api_endpoint = "/c"
    
    guard let url = URL(string: theURL + api_endpoint) else { return }
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Api-Key \(theKey)", forHTTPHeaderField: "Authorization")
    
    let jsonData = try? JSONEncoder().encode(posData)
    request.httpBody = jsonData
    
//    if let string = String(bytes: jsonData!, encoding: .utf8) {
//        print(string)
//    } else {
//        print("not a valid UTF-8 sequence")
//    }

    URLSession.shared.dataTask(with: request) { (data, response, error) in
    }
    .resume()
}
