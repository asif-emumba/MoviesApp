//
//  TicketViewModel.swift
//  Movie-app
//
//  Created by Asif-emumba on 29/01/2025.
//

import Foundation

class TicketViewModel {
    let selectedSeats: [Seat]
    var movieDetails: MovieDetails
    var cinemaDetails: Cinema
    var selectedDate: Session
    var selectedTime: SessionTime
    
    init(selectedSeats: [Seat], movieDetails: MovieDetails, cinemaDetails: Cinema, selectedDate: Session, selectedTime: SessionTime) {
        self.selectedSeats = selectedSeats
        self.movieDetails = movieDetails
        self.cinemaDetails = cinemaDetails
        self.selectedDate = selectedDate
        self.selectedTime = selectedTime
    }
}
