//
//  Date+ Extension.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation

extension Date {
    func futureDate(daysToAdd: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: daysToAdd, to: self) ?? self
    }
    
    func toLocalTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a" // Example: 08:30 AM
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}
