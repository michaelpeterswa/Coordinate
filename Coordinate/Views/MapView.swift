//
//  MapView.swift
//  Coordinate
//
//  Created by Michael Peters on 3/26/21.
//
import SwiftUI
import CoreLocation
import MapKit

struct CoordinateMapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @ObservedObject var locationManager = LocationManager()
    
    struct Location: Identifiable {
        var id = UUID()
        var coordinates: CLLocationCoordinate2D
    }

    var body: some View {
        let annotationItems: [Location] = [
            Location(coordinates: coordinate)
        ]
        
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: annotationItems) { item in
            MapMarker(coordinate: coordinate)
        }
            .onAppear {
                setRegion(coordinate)
            }
    }

    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }

    struct TrailheadMapView_Previews: PreviewProvider {
        static var previews: some View {
            CoordinateMapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
        }
    }
}
