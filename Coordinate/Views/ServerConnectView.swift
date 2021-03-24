//
//  ServerConnectView.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import SwiftUI

struct ServerConnectView: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        Form {
            Section(header: Text("SERVER SETTINGS")){
                TextField("Coordinate Server URL", text: $settings.coordinateURL)
                    .keyboardType(.asciiCapable)
                TextField("Device Name", text: $settings.deviceName)
                    .keyboardType(.asciiCapable)
                SecureField("API key", text: $settings.apiKey)
            }
            Section(header: Text("LOCATION SETTINGS")){
                Toggle("Enable Location Transmission", isOn: $settings.enabled)
                Text("Digits of specificity: \(settings.locationSpecificity, specifier: "%.0f")")
                Slider(value: $settings.locationSpecificity, in: 1...8, step: 1)
                //https://stackoverflow.com/questions/15965166/what-are-the-lengths-of-location-coordinates-latitude-and-longitude
                
            }
        }
    }
}

//struct ServerConnectView_Previews: PreviewProvider {
//    @ObservedObject var testSettings = Settings()
//    static var previews: some View {
//        ServerConnectView(settings: testSettings)
//    }
//}
