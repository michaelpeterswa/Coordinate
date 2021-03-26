//
//  PostButton.swift
//  Coordinate
//
//  Created by Michael Peters on 3/25/21.
//

import SwiftUI

struct PostButton: View {
    var settings: Settings
    var currLat: String
    var currLon: String
    
    var pos: OutboundCoordinate{
        OutboundCoordinate(device: settings.deviceName, lat: currLat, lon: currLon)
    }
    
    var body: some View {
        Button("Send Position") {
            SendPosition(posData: pos, theURL: settings.coordinateURL, theKey: settings.apiKey)
        }
    }
}

//struct PostButton_Previews: PreviewProvider {
//    static var previews: some View {
//        PostButton()
//    }
//}
