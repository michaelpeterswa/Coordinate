//
//  CoordinateRow.swift
//  Coordinate
//
//  Created by Michael Peters on 3/25/21.
//

import SwiftUI

struct CoordinateRow: View {
        var coordinate: Coordinate
            
        var body: some View {
            VStack {
                HStack {
                    Text(coordinate.id)
                        .fontWeight(.medium)
                        .padding(.leading)
                        .font(.title3)
                        .lineLimit(1)
                    Spacer()
                }
                HStack {
                    Text("time: " + epochToDate(time: coordinate.time))
                        .padding(.leading)
                    Spacer()
                    Text("device: " + coordinate.device).padding(.trailing)
                    
                }
                .foregroundColor(.accentColor)
                .font(.subheadline)
                
            }
            .padding([.top, .bottom], 5)
        }
    }
