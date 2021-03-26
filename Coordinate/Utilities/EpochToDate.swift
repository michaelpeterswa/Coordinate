//
//  EpochToDate.swift
//  Coordinate
//
//  Created by Michael Peters on 3/25/21.
//

import Foundation

// https://stackoverflow.com/questions/26849237/swift-convert-unix-time-to-date-and-time
func epochToDate(time: String) -> String{
    let double_time = Double(time) ?? 0.0
    let date = Date(timeIntervalSince1970: double_time/1000)
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
    dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
    dateFormatter.timeZone = .current
    let localDate = dateFormatter.string(from: date)
    
    return localDate
}
