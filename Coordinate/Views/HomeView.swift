//
//  HomeView.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @EnvironmentObject var settings: Settings
    @State var coordinates: [Coordinate] = []

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude.truncate(places: Int(settings.locationSpecificity)) ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude.truncate(places: Int(settings.locationSpecificity)) ?? 0)"
    }
    
    var body: some View {
        VStack {
            Text("Current GPS Data")
                 .font(.largeTitle)
                 .padding(.bottom, 20)
            Text("latitude: \(userLatitude)").font(.title3)
            Text("longitude: \(userLongitude)").font(.title3)
            Button(){
                 OpenInAppleMaps(name: "My Location", coordinate: locationManager.lastLocation!.coordinate)
            } label: {
                     VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                         Text("Open My Location in Apple Maps")
                             .foregroundColor(.accentColor)
                     }
            }
            .padding(.top, 20)
            Spacer()
        }
        .padding(.top, 40)
        .onAppear {
            // https://developer.apple.com/forums/thread/656655
            if settings.enabled {
                CoordinateRequest().getCoordinates(theURL: settings.coordinateURL, theKey: settings.apiKey) { (coordinates) in
                    self.coordinates = coordinates
                }
            }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
