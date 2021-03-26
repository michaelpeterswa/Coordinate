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
        let api_endpoint = "/c/x/10"
        
        guard let url = URL(string: theURL + api_endpoint) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Api-Key \(theKey)", forHTTPHeaderField: "Authorization")
//        print(request.allHTTPHeaderFields!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
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
    }
}
