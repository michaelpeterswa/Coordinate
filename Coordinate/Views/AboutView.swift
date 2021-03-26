//
//  AboutView.swift
//  Coordinate
//
//  Created by Michael Peters on 3/23/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Image("coordinate")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.accentColor, lineWidth: 4))
                .shadow(radius: 10)
                .padding(.top, 100)
            Text("Coordinate")
                .font(.largeTitle)
                .padding(.top)
            Text("version 1.0.0")
                .font(.subheadline)
                .foregroundColor(.gray)
            Link("View on Github", destination: URL(string: "https://github.com/halcyon-research/Coordinate")!)
                .font(.title3)
                .padding(.top, 20)
            Link("", destination: URL(string: "https://github.com/michaelpeterswa")!)
                .font(.title3)
                .padding(.top, 20)
            Text("Coordinate is a self-hosted location tracker. This application sends location data to a specified URL where the coordinate-server is running. Make sure that you are the owner of the server instance, or an attacker may be gathering your realtime location data. Be safe!")
                .padding([.leading, .trailing], 60)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
            Link("made by michaelpeterswa", destination: URL(string: "https://github.com/michaelpeterswa")!)
                .font(.headline)
                .padding(.bottom, 40)
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
