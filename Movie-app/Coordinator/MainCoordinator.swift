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
        let viewController = HomeViewController(coordinator: self, viewModel: HomeViewModel())
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func popToRootViewController() {
        navigationController.popViewController(animated: true)
    }

    func navigateToDetail(movieDetails: MovieDetails) {
        let movieDetailsViewController = MovieDetailsViewController(coordinator: self, viewModel: MovieDetailsViewModel(movieDetails: movieDetails))
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(movieDetailsViewController, animated: true)
    }
    
    func navigateToSelectSeats(movieDetails: MovieDetails, cinemaDetails: Cinema) {
        let selectSeactViewController = SelectSeatViewController(coordinator: self, viewModel: SelectSeatViewModel(movieDetails: movieDetails, cinemaDetails: cinemaDetails))
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(selectSeactViewController, animated: true)
    }
 
    func navigateToPayment(movieDetails: MovieDetails, cinemaDetails: Cinema,selectedSeats: [Seat], selectedDate: Session ,selectedTime: SessionTime) {
        let paymentViewController = PaymentViewController(
            coordinator: self,
            viewModel: PaymentViewModel(
                movieDetails: movieDetails,
                cinemaDetails: cinemaDetails,
                selectedSeats: selectedSeats,
                selectedDate: selectedDate,
                selectedTime: selectedTime
            )
        )
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(paymentViewController, animated: true)
    }
    
    func navigateToTicket(movieDetails: MovieDetails, cinemaDetails: Cinema,selectedSeats: [Seat], selectedDate: Session ,selectedTime: SessionTime) {
        let ticketViewController = TicketViewViewController(
            coordinator: self,
            viewModel: TicketViewModel(selectedSeats: selectedSeats, movieDetails: movieDetails, cinemaDetails: cinemaDetails, selectedDate: selectedDate, selectedTime: selectedTime)
        )
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(ticketViewController, animated: true)
    }
}
