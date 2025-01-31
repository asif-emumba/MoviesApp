//
//  ReservationStatus.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation

struct ReservationStatus: Codable {
    let title: String
    let backgroundColor: String
}

extension ReservationStatus {
    static var mockData: [ReservationStatus] {
        return [
            ReservationStatus(title: "Available", backgroundColor: "grayishBlack"),
            ReservationStatus(title: "Reserved", backgroundColor: "selectedColor"),
            ReservationStatus(title: "Selected", backgroundColor: "highlighterColor")
        ]
    }
}
