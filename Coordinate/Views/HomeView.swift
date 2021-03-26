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
    @State private var sendTimer: Timer?
    @State var timerOn: Bool = false

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
            Button(){
                self.sendTimer?.invalidate()
                self.timerOn = false
            } label: {
                     VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                         Text("Stop Timer")
                             .foregroundColor(.accentColor)
                     }
            }.padding(.bottom, 20)
//            PostButton(settings: settings, currLat: userLatitude, currLon: userLongitude)
            CoordinateList(coordinates: self.coordinates)
            Spacer()
        }
        .padding(.top, 40)
        .onAppear {
            // https://developer.apple.com/forums/thread/656655
            if settings.enabled {
                CoordinateRequest().getCoordinates(theURL: settings.coordinateURL, theKey: settings.apiKey) { (coordinates) in
                    self.coordinates = coordinates
                    if !self.timerOn {
                        self.sendTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
                            self.timerOn = true
                            let pos = OutboundCoordinate(device: settings.deviceName, lat: userLatitude, lon: userLongitude)
                            SendPosition(posData: pos, theURL: settings.coordinateURL, theKey: settings.apiKey)
                            count += 1
                        }
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
