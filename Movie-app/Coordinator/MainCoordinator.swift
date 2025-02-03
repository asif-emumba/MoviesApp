//
//  MainCoordinator.swift
//  Movie-app
//
//  Created by Emumba on 18/01/2025.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeViewController(viewModel: HomeViewModel())
        viewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func popToRootViewController() {
        navigationController.popViewController(animated: true)
    }

    func navigateToDetail(movieDetails: MovieDetails) {
        let movieDetailsViewController = MovieDetailsViewController(viewModel: MovieDetailsViewModel(movieDetails: movieDetails))
        movieDetailsViewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(movieDetailsViewController, animated: true)
    }
    
    func navigateToSelectSeats(movieDetails: MovieDetails, cinemaDetails: Cinema) {
        let selectSeactViewController = SelectSeatViewController(viewModel: SelectSeatViewModel(movieDetails: movieDetails, cinemaDetails: cinemaDetails))
        selectSeactViewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(selectSeactViewController, animated: true)
    }
 
    func navigateToPayment(movieDetails: MovieDetails, cinemaDetails: Cinema,selectedSeats: [Seat], selectedDate: Session ,selectedTime: SessionTime) {
        let paymentViewController = PaymentViewController(
            viewModel: PaymentViewModel(
                movieDetails: movieDetails,
                cinemaDetails: cinemaDetails,
                selectedSeats: selectedSeats,
                selectedDate: selectedDate,
                selectedTime: selectedTime
            )
        )
        paymentViewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(paymentViewController, animated: true)
    }
    
    func navigateToTicket(movieDetails: MovieDetails, cinemaDetails: Cinema,selectedSeats: [Seat], selectedDate: Session ,selectedTime: SessionTime) {
        let ticketViewController = TicketViewViewController(
            viewModel: TicketViewModel(selectedSeats: selectedSeats, movieDetails: movieDetails, cinemaDetails: cinemaDetails, selectedDate: selectedDate, selectedTime: selectedTime)
        )
        ticketViewController.coordinator = self
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(ticketViewController, animated: true)
    }
}
