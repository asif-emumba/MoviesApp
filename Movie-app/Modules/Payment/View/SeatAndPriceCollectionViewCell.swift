//
//  SeatAndPriceCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import UIKit

class SeatAndPriceCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SeatAndPriceCollectionViewCell"
    
    let orderIdLabel = UILabel.createLabel(with: MoviePaymentLabelConfiguration())
    let seatLabel = UILabel.createLabel(with: MoviePaymentLabelConfiguration())
    let orderId = UILabel.createLabel(with: MovieDetailsLabelConfiguration())
    let seatNumber = UILabel.createLabel(with: MovieDetailsLabelConfiguration())
    let totalLabel = UILabel.createLabel(with: MoviePaymentLabelConfiguration())
    let priceLabel = UILabel.createLabel(with: CinemaLabelLabelConfiguration())
    private let discountView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.detailsCardBgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    let discountImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icDiscount
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = CustomColors.yellowColor
        button.setTitle("Apply", for: .normal)
        button.setTitleColor(CustomColors.backgroundColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let discountLabel = UILabel.createLabel(with: MovieDirectorNameLabelConfiguration())
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.detailsCardBgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        contentView.addSubview(orderIdLabel)
        contentView.addSubview(seatLabel)
        contentView.addSubview(orderId)
        contentView.addSubview(seatNumber)
        contentView.addSubview(totalLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(discountView)
        contentView.addSubview(dividerView)
        discountView.addSubview(discountImageView)
        discountView.addSubview(applyButton)
        discountView.addSubview(discountLabel)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            orderIdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            orderIdLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            orderId.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            orderId.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            seatLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            seatLabel.topAnchor.constraint(equalTo: orderIdLabel.bottomAnchor, constant: 24),
            
            seatNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            seatNumber.topAnchor.constraint(equalTo: orderId.bottomAnchor, constant: 24),
            
            discountView.topAnchor.constraint(equalTo: seatLabel.bottomAnchor, constant: 25),
            discountView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            discountView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            discountView.heightAnchor.constraint(equalToConstant: 40),
            
            discountImageView.leadingAnchor.constraint(equalTo: discountView.leadingAnchor, constant: 12),
            discountImageView.centerYAnchor.constraint(equalTo: discountView.centerYAnchor),
            discountImageView.heightAnchor.constraint(equalToConstant: 20),
            discountImageView.widthAnchor.constraint(equalToConstant: 20),
            
            discountLabel.leadingAnchor.constraint(equalTo: discountImageView.trailingAnchor, constant: 8),
            discountLabel.centerYAnchor.constraint(equalTo: discountImageView.centerYAnchor),
            
            applyButton.trailingAnchor.constraint(equalTo: discountView.trailingAnchor),
            applyButton.topAnchor.constraint(equalTo: discountView.topAnchor),
            applyButton.bottomAnchor.constraint(equalTo: discountView.bottomAnchor),
            applyButton.widthAnchor.constraint(equalToConstant: 119),
            
            dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dividerView.topAnchor.constraint(equalTo: discountView.bottomAnchor, constant: 32),
            dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 2),
            
            totalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            totalLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 38),
            
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 32)
        ])
    }
    
    func configure(with seatInfo: MovieOrderInfo) {
        orderIdLabel.text = "Order ID"
        orderId.text = "11233445566"
        seatLabel.text = "Seat"
        seatNumber.text = seatInfo.selectedSeats.map { $0.id }.joined(separator: ", ")
        discountLabel.text = "discount code"
        totalLabel.text = "Total"
        priceLabel.text = seatInfo.totalPrice.price
    }
    
}
