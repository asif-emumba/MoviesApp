//
//  PaymentViewModel.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation

class PaymentViewModel {
    let selectedSeats: [Seat]
    let selectedDate: Session
    let selectedTime: SessionTime
    var sections: [CollectionViewSection] = []
    
    init(selectedSeats: [Seat], selectedDate: Session, selectedTime: SessionTime) {
        self.selectedSeats = selectedSeats
        self.selectedDate = selectedDate
        self.selectedTime = selectedTime
    }
}
