//
//  TicketViewViewController.swift
//  Movie-app
//
//  Created by Asif-emumba on 29/01/2025.
//

import UIKit

class TicketViewViewController: UIViewController {

    let coordinator: MainCoordinator?
    let viewModel: TicketViewModel
    let appBarView = AppBarView()
    let dottedLineView = DottedLine()
    let movieCoverView = MovieCoverView()
    let seatAndDateView = SeatAndDateView()
    let orderIdLabel = UILabel.createLabel(with: TicketLabelConfiguration())
    let cinemaAndPriceView = PriceAndCinemaView()
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.detailsCardBgColor?.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ticketView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.textColor
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let barCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icBarCode
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = CustomColors.textColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
  
    init(coordinator: MainCoordinator?, viewModel: TicketViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUi()
        configureAppBar()
    }

    private func configureUi() {
        view.addSubview(appBarView)
        view.addSubview(ticketView)
        ticketView.addSubview(movieCoverView)
        ticketView.addSubview(seatAndDateView)
        ticketView.addSubview(dividerView)
        ticketView.addSubview(cinemaAndPriceView)
        ticketView.addSubview(dottedLineView)
        ticketView.addSubview(barCodeImageView)
        ticketView.addSubview(orderIdLabel)
        view.backgroundColor = CustomColors.backgroundColor
        orderIdLabel.textAlignment = .center
        orderIdLabel.text = "Order ID: 123456789"
        setUpConstrains()
        configureViewModel()
    }
    
    private func configureAppBar() {
        appBarView.delegate = self
        appBarView.setTitle("My Ticket")
    }
    
}

extension TicketViewViewController {
    private func configureViewModel() {
        movieCoverView.configureView(with: viewModel.movieDetails)
        seatAndDateView.configure(with: viewModel.selectedDate, selectedTime: viewModel.selectedTime, selectedSeat: viewModel.selectedSeats)
        cinemaAndPriceView.configure(with: viewModel.cinemaDetails)
    }
    private func setUpConstrains() {
        dottedLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            appBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            appBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            appBarView.heightAnchor.constraint(equalToConstant: 48),
            
            ticketView.topAnchor.constraint(equalTo: appBarView.bottomAnchor, constant: 40),
            ticketView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ticketView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ticketView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            
            movieCoverView.topAnchor.constraint(equalTo: ticketView.topAnchor, constant: 24),
            movieCoverView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 24),
            movieCoverView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -24),
            movieCoverView.heightAnchor.constraint(equalToConstant: 177),
            
            seatAndDateView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 24),
            seatAndDateView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -24),
            seatAndDateView.topAnchor.constraint(equalTo: movieCoverView.bottomAnchor, constant: 35),
            seatAndDateView.heightAnchor.constraint(equalToConstant: 48),
            
            dividerView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 24),
            dividerView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -24),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: seatAndDateView.bottomAnchor, constant: 32),
            
            cinemaAndPriceView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 24),
            cinemaAndPriceView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -24),
            cinemaAndPriceView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 16),
            
            dottedLineView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor,constant: -24),
            dottedLineView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor,constant: 24),
            dottedLineView.topAnchor.constraint(equalTo: cinemaAndPriceView.bottomAnchor, constant: 22),
            dottedLineView.heightAnchor.constraint(equalToConstant: 48),
            
            barCodeImageView.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 16),
            barCodeImageView.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -16),
            barCodeImageView.heightAnchor.constraint(equalToConstant: 100),
            
            orderIdLabel.topAnchor.constraint(equalTo: barCodeImageView.bottomAnchor, constant: 8),
            orderIdLabel.leadingAnchor.constraint(equalTo: ticketView.leadingAnchor, constant: 16),
            orderIdLabel.trailingAnchor.constraint(equalTo: ticketView.trailingAnchor, constant: -16),
            orderIdLabel.bottomAnchor.constraint(equalTo: ticketView.bottomAnchor, constant: -16)
        ])
    }
}

extension TicketViewViewController: AppBarDelegate {
    func didTapBackButton() {
        coordinator?.popToRootViewController()
    }
}
