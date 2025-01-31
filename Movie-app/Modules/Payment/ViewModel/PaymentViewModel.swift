//
//  PaymentViewModel.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation

protocol PaymentViewModelDelegate: AnyObject {
    func reloadData()
}
class PaymentViewModel {
    
    var sections: [CollectionViewSection] = []
    let selectedSeats: [Seat]
    var movieDetails: MovieDetails
    var cinemaDetails: Cinema
    var selectedDate: Session
    var selectedTime: SessionTime
    var movieInfoData: MovieInfo? = nil
    var movieOrderInfo: MovieOrderInfo? = nil
    var paymentGatewayData = PaymentGateway.mockData
    weak var delegete: PaymentViewModelDelegate?
    weak var paymentGatewayDelegate: PaymentGatewaySectionCellItemDelegate?
    
    init(movieDetails: MovieDetails, cinemaDetails: Cinema, selectedSeats: [Seat], selectedDate: Session, selectedTime: SessionTime) {
        self.selectedSeats = selectedSeats
        self.selectedDate = selectedDate
        self.selectedTime = selectedTime
        self.cinemaDetails = cinemaDetails
        self.movieDetails = movieDetails
    }
    
    func updateMovieInfoData() {
        self.movieOrderInfo = MovieOrderInfo(selectedSeats: selectedSeats, totalPrice: cinemaDetails)
        self.movieInfoData = MovieInfo(
            movieDetails: movieDetails,
            cinemaDetails: cinemaDetails,
            selectedTime: selectedTime,
            selectedDate: selectedDate
        )
        setUpSections()
        delegete?.reloadData()
    }

    func setUpSections() {
        guard let movieInfo = movieInfoData else {
            return
        }
        guard let moviOrderDetails = movieOrderInfo else {
            return
        }
        let movieOrderInfoSectionItems = [SeatAndPriceSectionCellItem(item: moviOrderDetails)]
        let sectionItems = [PaymentSectionCellItem(item: movieInfo)]
        let paymentCoverSection = MoviePaymentSection(headerTitle: "", items: sectionItems)
        let movieOrderSection = SeatAndPriceSection(headerTitle: "", items: movieOrderInfoSectionItems)
        let paymentGatewaySection = PaymentGatewaySection(
            headerTitle: "Payment Method",
            items: paymentGatewayData.map {
                PaymentGatewaySectionCellItem(item: $0, isSelected: $0.isSelected, delegate: paymentGatewayDelegate)
            })
        self.sections = [paymentCoverSection, movieOrderSection, paymentGatewaySection]
        delegete?.reloadData()
    }
    
    func updateSelectedPayment(to index: Int) {
        for i in 0..<paymentGatewayData.count {
            paymentGatewayData[i].isSelected = false
        }
        paymentGatewayData[index].isSelected = true
        setUpSections()
    }
    
}
