//
//  Settings.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import UIKit
import Foundation

class Settings: ObservableObject {
    @Published var deviceName = UIDevice.current.name
        .lowercased()
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .replacingOccurrences(of: " ", with: "")
    @Published var apiKey = ""
    @Published var coordinateURL = ""
    @Published var enabled = true
    @Published var locationSpecificity: Float = 4
    @Published var timeString = ""
    @Published var distanceString = ""
//    @State private var pingDelay: Int = 0
}
