//
//  CoordinateList.swift
//  Coordinate
//
//  Created by Michael Peters on 3/26/21.
//

import SwiftUI

struct CoordinateList: View {
    var coordinates: [Coordinate]
    
    var body: some View {
        if coordinates.count != 0 {
                NavigationView {
                    List(coordinates) {coordinate in
                        NavigationLink(destination: CoordinateView(coordinate: coordinate)){
                            CoordinateRow(coordinate: coordinate)
                        }
                    }
                    .padding(.trailing, 20)
            }
        }
        else {
            Text("Data not loaded.").font(.title2).onAppear() {
                print(coordinates)
            }
        }
    }
}
