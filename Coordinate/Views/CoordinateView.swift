//
//  CoordinateView.swift
//  Coordinate
//
//  Created by Michael Peters on 3/26/21.
//

import SwiftUI

struct CoordinateView: View {
    var coordinate: Coordinate
    
    var body: some View {
        CoordinateMapView(coordinate: coordinate.locationCoordinate)
            .ignoresSafeArea(edges: .top)
            .cornerRadius(CGFloat(10))
    }
}
