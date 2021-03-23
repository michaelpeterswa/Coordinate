//
//  OpenInAppleMaps.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import Foundation
import MapKit

func OpenInAppleMaps(name: String, coordinate: CLLocationCoordinate2D) {
    let coord = coordinate
    
    let placemark = MKPlacemark(coordinate: coord)
    let mapitem = MKMapItem(placemark: placemark)
    mapitem.name = name
    mapitem.openInMaps(launchOptions: nil)
}
