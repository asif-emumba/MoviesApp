//
//  PriceAndCinemaView.swift
//  Movie-app
//
//  Created by Asif-emumba on 29/01/2025.
//

import UIKit

class PriceAndCinemaView: UIView {

    let priceLabel = UILabel.createLabel(with: CinemaNameTicketLabelConfiguration())
    let noteBookLabel = UILabel.createLabel(with: TicketLabelConfiguration())
    let cinemaNameLabel = UILabel.createLabel(with: CinemaNameTicketLabelConfiguration())
    let cinemaAddressLabel = UILabel.createLabel(with: TicketLabelConfiguration())
    let cinemaLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let noteBookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icNoteBook
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let priceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icPrice
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icLocation
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configueUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configueUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(priceImageView)
        addSubview(priceLabel)
        addSubview(locationImageView)
        addSubview(cinemaNameLabel)
        addSubview(cinemaLogoImageView)
        addSubview(cinemaAddressLabel)
        addSubview(noteBookImageView)
        addSubview(noteBookLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            priceImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceImageView.topAnchor.constraint(equalTo: topAnchor),
            priceImageView.heightAnchor.constraint(equalToConstant: 24),
            priceImageView.widthAnchor.constraint(equalToConstant: 24),
            
            priceLabel.leadingAnchor.constraint(equalTo: priceImageView.trailingAnchor, constant: 8),
            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            locationImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationImageView.topAnchor.constraint(equalTo: priceImageView.bottomAnchor, constant: 8),
            locationImageView.heightAnchor.constraint(equalToConstant: 24),
            locationImageView.widthAnchor.constraint(equalToConstant: 24),
            
            cinemaNameLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 8),
            cinemaNameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 14),
            
            cinemaLogoImageView.leadingAnchor.constraint(equalTo: cinemaNameLabel.trailingAnchor, constant: 8),
            cinemaLogoImageView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
            cinemaLogoImageView.heightAnchor.constraint(equalToConstant: 16),
            cinemaLogoImageView.widthAnchor.constraint(equalToConstant: 32),
            
            cinemaAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            cinemaAddressLabel.topAnchor.constraint(equalTo: cinemaNameLabel.bottomAnchor, constant: 8),
            cinemaAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            noteBookImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            noteBookImageView.topAnchor.constraint(equalTo: cinemaAddressLabel.bottomAnchor, constant: 12),
            noteBookImageView.heightAnchor.constraint(equalToConstant: 24),
            noteBookImageView.widthAnchor.constraint(equalToConstant: 24),
            
            noteBookLabel.leadingAnchor.constraint(equalTo: noteBookImageView.trailingAnchor, constant: 8),
            noteBookLabel.topAnchor.constraint(equalTo: cinemaAddressLabel.bottomAnchor, constant: 10),
            noteBookLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            noteBookLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func configure(with cinemaDetails: Cinema) {
        noteBookLabel.text = "Show this QR code to the ticket counter to receive your ticket"
        cinemaNameLabel.text = cinemaDetails.name
        cinemaAddressLabel.text = "\(cinemaDetails.address)+\(cinemaDetails.city)"
        priceLabel.text = cinemaDetails.price
        cinemaLogoImageView.image = UIImage(named: cinemaDetails.logo)
    }
}
