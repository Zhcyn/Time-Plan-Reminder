//
//  Date+.swift
//  Reminder
//
//  Created by nguyen.duc.huyb on 6/28/19.
//  Copyright © 2019 nguyen.duc.huyb. All rights reserved.
//

import Foundation

extension Date {
    
    // Convert TimeInterval to Date
    func convertToDate() -> (days: String, times: String)?{
        let currentDate = Date()
        
        let difference = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: self)
        
        
        guard let sec = difference.second,
            let min = difference.minute, let hr = difference.hour,
            let days = difference.day else { return nil }
        
        let formattedDayString = String(format: "%02ld", days, min)
        let formattedTimeString = String(format: "%02ld:%02ld:%02ld", hr, min, sec)
        
        return (formattedDayString, formattedTimeString)
    }

    func convertDateFormate() -> String {
        // Day
        let calendar = Calendar.current
        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: self)
        
        // Formate
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "MMMM"
        let newDate = dateFormate.string(from: self)
        
        var day  = "\(anchorComponents.day!)"
        switch (day) {
        case "1" , "21" , "31":
            day.append("st")
        case "2" , "22":
            day.append("nd")
        case "3" ,"23":
            day.append("rd")
        default:
            day.append("th")
        }
        return "\(newDate) \(day) \(anchorComponents.year!)"
    }
    
    func convertTimeFormate() -> String {
        // Formate
        let dateFormate = DateFormatter()
        dateFormate.dateFormat = "HH:mm"
        let newDate = dateFormate.string(from: self)
        
        return "\(newDate)"
    }
    
    // Create date event with second component
    func createDateEvent() -> Date {
        let date = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)
        
        var dateComponents = DateComponents()
        dateComponents.year = date.year
        dateComponents.month = date.month
        dateComponents.day = date.day
        dateComponents.hour = date.hour
        dateComponents.minute = date.minute
        dateComponents.second = 0
        let userCalendar = Calendar.current
        let selectedDate = userCalendar.date(from: dateComponents)
        return selectedDate ?? Date()
    }
}
