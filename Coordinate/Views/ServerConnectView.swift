//
//  ServerConnectView.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var deviceName = UIDevice.current.name
        .lowercased()
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .replacingOccurrences(of: " ", with: "")
    @Published var apiKey = ""
    @Published var coordinateURL = ""
    @Published var enabled = true
    @Published var locationSpecificity: Float = 8
//    @State private var pingDelay: Int = 0
}

struct ServerConnectView: View {

    @ObservedObject var settings = Settings()
    
    var body: some View {
        Form {
            Section(header: Text("SERVER SETTINGS")){
                TextField("Coordinate Server URL", text: $settings.coordinateURL)
                TextField("Device Name", text: $settings.deviceName)
                SecureField("API key", text: $settings.apiKey)
            }
            Section(header: Text("LOCATION SETTINGS")){
                Toggle("Enable Location Transmission", isOn: $settings.enabled)
                Slider(value: $settings.locationSpecificity, in: 1...8, step: 1)
                //https://stackoverflow.com/questions/15965166/what-are-the-lengths-of-location-coordinates-latitude-and-longitude
                Text("Digits of specificity: \(settings.locationSpecificity, specifier: "%.0f")")
            }
        }
    }
}

struct ServerConnectView_Previews: PreviewProvider {
    static var previews: some View {
        ServerConnectView()
    }
}
