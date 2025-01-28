//
//  Sessions.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation

struct Session {
    var date: Date
    var formattedDate: String
    var isSelected: Bool
    
    init(date: Date, isSelected: Bool = false) {
        self.date = date
        self.isSelected = isSelected
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        self.formattedDate = dateFormatter.string(from: date)
    }
}

struct SessionTime {
    var date: Date
    var formattedTime: String
    var isSelected: Bool
    
    init(date: Date, isSelected: Bool = false) {
        self.date = date
        self.isSelected = isSelected
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        self.formattedTime = timeFormatter.string(from: date)
    }
}
