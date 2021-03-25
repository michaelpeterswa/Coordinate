//
//  CoordinateData.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import Foundation
import SwiftUI
import CoreLocation

struct Coordinate: Hashable, Codable, Identifiable {
    var id: String
    var time: String
    var device: String
    var lat: String
    var lon: String
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: Double(lat) ?? 0.0,
            longitude: Double(lon) ?? 0.0
        )
    }
}

class CoordinateRequest {
    func getCoordinates(theURL: String, theKey: String, completion: @escaping ([Coordinate]) -> ()) {
        guard let url = URL(string: "http://192.168.1.209:6968/c") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Api-Key \(theKey)", forHTTPHeaderField: "Authorization")
        print(request.allHTTPHeaderFields!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let responseString = String(bytes: data, encoding: .utf8) {
                        // The response body seems to be a valid UTF-8 string, so print that.
                        print(responseString)
                    } else {
                        // Otherwise print a hex dump of the body.
                        print(data as NSData)
                    }
                if let coordinates = try? JSONDecoder().decode([Coordinate].self, from: data) {
                    DispatchQueue.main.async {
                        completion(coordinates)
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "unknown")")
        }
        .resume()
//        URLSession.shared.dataTask(with: request) { (responseBody, response, error) in
//            if let error = error {
//                // handle transport error
//            }
//            let response = response as! HTTPURLResponse
//            let responseBody = responseBody!
//            if !(200...299).contains(response.statusCode) {
//                // handle HTTP server-side error
//            }
//            // handle success
//            if let responseString = String(bytes: responseBody, encoding: .utf8) {
//                        // The response body seems to be a valid UTF-8 string, so print that.
//                        print(responseString)
//                    } else {
//                        // Otherwise print a hex dump of the body.
//                        print(responseBody as NSData)
//                    }
//            print("success")
//        }.resume()
    }
}
