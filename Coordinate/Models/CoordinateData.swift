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
    var id: Int
    var device: String
    var lat: Double
    var lon: Double
    
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(
            latitude: lat,
            longitude: lon)
    }
    
}
