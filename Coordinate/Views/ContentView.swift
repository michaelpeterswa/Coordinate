//
//  ContentView.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case serversettings
        case about
    }
    
    var body: some View {
        TabView(selection: $selection){
                    HomeView()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    ServerConnectView()
                        .tabItem {
                            Label("Settings", systemImage: "rectangle.and.pencil.and.ellipsis")
                        }
                    AboutView()
                        .tabItem {
                            Label("About", systemImage: "bubble.right.fill")
                        }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
