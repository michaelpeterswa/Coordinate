//
//  Settings.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//  https://blog.maximeheckel.com/snippets/2020-11-27-storing-user-settings-swift

import UIKit
import Foundation

class Settings: ObservableObject {
    @Published var deviceName: String{
        didSet {
            UserDefaults.standard.set(deviceName, forKey: "device")
        }
    }
    @Published var apiKey: String {
        didSet {
            UserDefaults.standard.set(apiKey, forKey: "apikey")
        }
    }
    @Published var coordinateURL: String {
        didSet {
            UserDefaults.standard.set(coordinateURL, forKey: "coordinateurl")
        }
    }
    @Published var enabled: Bool {
        didSet {
            UserDefaults.standard.set(enabled, forKey: "enabled")
        }
    }
    @Published var locationSpecificity: Float {
        didSet {
            UserDefaults.standard.set(locationSpecificity, forKey: "locspec")
        }
    }
    
    init() {
        // self.speed = (UserDefaults.standard.object(forKey: "speed") == nil ? Speed.mph : Speed(rawValue: UserDefaults.standard.object(forKey: "speed") as! Int)) ?? Speed.mph
        self.deviceName = UserDefaults.standard.string(forKey: "device") ?? "device"
        self.apiKey = UserDefaults.standard.string(forKey: "apikey") ?? ""
        self.coordinateURL = UserDefaults.standard.string(forKey: "coordinateurl") ?? ""
        self.enabled = UserDefaults.standard.bool(forKey: "enabled")
        self.locationSpecificity = UserDefaults.standard.float(forKey: "locspec")
    }
}
