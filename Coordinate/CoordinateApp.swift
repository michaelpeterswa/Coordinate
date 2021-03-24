//
//  CoordinateApp.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import SwiftUI

@main
struct CoordinateApp: App {
    var settings = Settings()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(settings)
        }
    }
}
