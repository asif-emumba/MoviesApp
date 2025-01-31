//
//  SelectSeatViewModel.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation

protocol SeatGridViewModelDelegate: AnyObject {
    func reloadSeatData()
}

class SelectSeatViewModel {
    let movieDetails: MovieDetails
    let cinemaDetails: Cinema
    var seats: [[Seat]] = []
    var sections: [CollectionViewSection] = []
    var selectedSeats: [Seat] = []
    var allStatus: [ReservationStatus] = ReservationStatus.mockData
    var sessionDays: [Session] = []
    var sessionTime: [SessionTime] = []
    
    weak var delegate: SeatGridViewModelDelegate?
    weak var seatCellDelegate: SeatCollectionViewCellItemDelegate?
    weak var dateDelegate: DateSectionCellItemDelegate?
    weak var timeDelegate: TimeSectionCellItemDelegate?
    
    init(movieDetails: MovieDetails, cinemaDetails: Cinema) {
        self.movieDetails = movieDetails
        self.cinemaDetails = cinemaDetails
        let today = Date()
        sessionDays = generateSessionDays(from: today, for: 60)
        sessionTime = generateSessionHours(from: 8, to: 22)
    }
    
    func fetchSeats() {
        seats = generateSeatData(rows: 10, columns: 12)
        populateSections()
        delegate?.reloadSeatData()
    }
    
    func generateSessionDays(from startDate: Date, for daysCount: Int) -> [Session] {
        for i in 0..<daysCount {
            let date = startDate.futureDate(daysToAdd: i)
            let session = Session(date: date)
            sessionDays.append(session)
        }
        
        return sessionDays
    }
    
    func generateSessionHours(from startHour: Int, to endHour: Int) -> [SessionTime] {
        sessionTime.removeAll()
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        dateComponents.timeZone = TimeZone.current
        
        for hour in startHour...endHour {
            dateComponents.hour = hour
            dateComponents.minute = 0
            if let firstSession = calendar.date(from: dateComponents) {
                sessionTime.append(SessionTime(date: firstSession))
            }
            dateComponents.minute = 30
            if let secondSession = calendar.date(from: dateComponents) {
                sessionTime.append(SessionTime(date: secondSession))
            }
        }
        return sessionTime
    }
    
    private func populateSections() {
        sections = [
            SeatGridSection(
                headerTitle: "",
                items: seats.flatMap { row in
                    row.map { seat in
                        SeatCollectionViewCellItem(seat: seat, delegate: seatCellDelegate)
                    }
                }
            ),
            SeatStatusSection(headerTitle: "", items: allStatus.map{ SeatStatusSectionCellItem(item: $0) }),
            DateSection(headerTitle: "Select Date & Time", items: sessionDays.map{ DateSectionCellItem(item: $0, isSelected: $0.isSelected, delegate: dateDelegate) }),
            TimeSection(headerTitle: "", items: sessionTime.map{ TimeSectionCellItem(item: $0, isSelected: $0.isSelected, delegate: timeDelegate) })
        ]
        delegate?.reloadSeatData()
    }
    
    func generateSeatData(rows: Int, columns: Int) -> [[Seat]] {
        var seatData: [[Seat]] = []
        
        let numberOfSeatsToSelect = 3
        let numberOfSeatsToReserve = 8
        
        var allSeats: [String] = []
        for rowIndex in 0..<rows {
            let rowLetter = String(UnicodeScalar(65 + rowIndex)!)
            for columnIndex in 1...columns {
                let seatName = "\(rowLetter)\(columnIndex)"
                allSeats.append(seatName)
            }
        }
    
        allSeats.shuffle()
        let selectedSeatIDs = Set(allSeats.prefix(numberOfSeatsToSelect))
        let reservedSeatIDs = Set(allSeats.dropFirst(numberOfSeatsToSelect).prefix(numberOfSeatsToReserve))
    
        var selectedSeats: [Seat] = []
        
        for rowIndex in 0..<rows {
            var row: [Seat] = []
            let rowLetter = String(UnicodeScalar(65 + rowIndex)!)
            
            for columnIndex in 1...columns {
                let seatName = "\(rowLetter)\(columnIndex)"
                var seatStatus: SeatStatus = .available
                
                if selectedSeatIDs.contains(seatName) {
                    seatStatus = .selected
                    let selectedSeat = Seat(id: seatName, status: seatStatus)
                    selectedSeats.append(selectedSeat)
                }
                else if reservedSeatIDs.contains(seatName) {
                    seatStatus = .reserved
                }
                
                let seat = Seat(id: seatName, status: seatStatus)
                row.append(seat)
            }
            
            seatData.append(row)
        }
        
        self.selectedSeats = selectedSeats
        return seatData
    }
    
    // Function to handle selection change
    func updateSelectedDate(to index: Int) {
        for i in 0..<sessionDays.count {
            sessionDays[i].isSelected = false
        }
        sessionDays[index].isSelected = true
        populateSections()
    }

    func updateSelectedTime(to index: Int) {
        for i in 0..<sessionTime.count {
            sessionTime[i].isSelected = false
        }
        sessionTime[index].isSelected = true
        populateSections()
    }


}
