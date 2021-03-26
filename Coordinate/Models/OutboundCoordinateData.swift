//
//  OutboundCoordinateData.swift
//  Coordinate
//
//  Created by Michael Peters on 3/25/21.
//

import Foundation

class OutboundCoordinate: Encodable {
    var device: String
    var lat: String
    var lon: String
    
    init(device: String, lat: String, lon: String){
        self.device = device
        self.lat = lat
        self.lon = lon
    }
}
