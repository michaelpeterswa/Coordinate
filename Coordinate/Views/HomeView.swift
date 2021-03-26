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
    @State var count = 0

    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude.truncate(places: Int(settings.locationSpecificity)) ?? 0)"
    }

    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude.truncate(places: Int(settings.locationSpecificity)) ?? 0)"
    }
    
    var body: some View {
        VStack {
            Text("Coordinate")
                 .font(.largeTitle)
                 .padding(.bottom, 20)
            Text("latitude: \(userLatitude)").font(.title3)
            Text("longitude: \(userLongitude)").font(.title3)
            Button(){
                CoordinateRequest().getCoordinates(theURL: settings.coordinateURL, theKey: settings.apiKey) { (coordinates) in
                    self.coordinates = coordinates
                    
                }
            } label: {
                     VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                         Text("Refresh")
                             .foregroundColor(.accentColor)
                     }
            }
            .padding(.top, 20)
            PostButton(settings: settings, currLat: userLatitude, currLon: userLongitude)
            if coordinates.count != 0 {
                List(coordinates) {coordinate in
                    CoordinateRow(coordinate: coordinate)
                }
                .padding(.trailing, 20)
            }
            else {
                Text("Data not loaded.").font(.title2)
            }
            Spacer()
        }
        .padding(.top, 40)
        .onAppear {
            // https://developer.apple.com/forums/thread/656655
            if settings.enabled {
                CoordinateRequest().getCoordinates(theURL: settings.coordinateURL, theKey: settings.apiKey) { (coordinates) in
                    self.coordinates = coordinates
                let _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
                    print("sending location... \(count)")
                    let pos = OutboundCoordinate(device: settings.deviceName, lat: userLatitude, lon: userLongitude)
                    SendPosition(posData: pos, theURL: settings.coordinateURL, theKey: settings.apiKey)
                    count += 1
                    }
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
