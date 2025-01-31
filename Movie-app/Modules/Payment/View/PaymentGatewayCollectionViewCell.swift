//
//  PaymentGatewayCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import UIKit

protocol PaymentGatewayCollectionViewCellDelegate: AnyObject {
    func isSelectedPaymentMethod(cell: PaymentGatewayCollectionViewCell)
}

class PaymentGatewayCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PaymentGatewayCollectionViewCell"
    weak var delegate: PaymentGatewayCollectionViewCellDelegate?
    
    let paymentNameLabel = UILabel.createLabel(with: MovieDescriptionLabelConfigurations())
    let paymentDescriptionLabel = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    let paymentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let forwordIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icForwordArrow
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var paymentLabelView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var borderView: UIView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
        addTapGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        contentView.addSubview(paymentImageView)
        contentView.addSubview(paymentLabelView)
        contentView.addSubview(forwordIconView)
        paymentLabelView.addSubview(paymentDescriptionLabel)
        paymentLabelView.addSubview(paymentNameLabel)
        addBorderView()
        setUpConstrians()
    }
    
    private func setUpConstrians() {
        NSLayoutConstraint.activate([
            paymentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            paymentImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            paymentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            paymentImageView.heightAnchor.constraint(equalToConstant: 48),
            paymentImageView.widthAnchor.constraint(equalToConstant: 86),
            
            paymentLabelView.leadingAnchor.constraint(equalTo: paymentImageView.trailingAnchor, constant: 16),
            paymentLabelView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            paymentNameLabel.leadingAnchor.constraint(equalTo: paymentLabelView.leadingAnchor),
            paymentNameLabel.topAnchor.constraint(equalTo: paymentLabelView.topAnchor),
            paymentNameLabel.trailingAnchor.constraint(equalTo: paymentLabelView.trailingAnchor),
            
            paymentDescriptionLabel.topAnchor.constraint(equalTo: paymentNameLabel.bottomAnchor, constant: 8),
            paymentDescriptionLabel.leadingAnchor.constraint(equalTo: paymentLabelView.leadingAnchor),
            paymentDescriptionLabel.trailingAnchor.constraint(equalTo: paymentLabelView.trailingAnchor),
            paymentDescriptionLabel.bottomAnchor.constraint(equalTo: paymentLabelView.bottomAnchor),
            
            forwordIconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            forwordIconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            forwordIconView.heightAnchor.constraint(equalToConstant: 24),
            forwordIconView.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // Add the border view for the selected state.
    private func addBorderView() {
        borderView = UIView()
        borderView?.translatesAutoresizingMaskIntoConstraints = false
        borderView?.backgroundColor = CustomColors.yellowColor?.withAlphaComponent(0.1)
        borderView?.layer.borderColor = CustomColors.yellowColor?.cgColor ?? UIColor.yellow.cgColor
        borderView?.layer.borderWidth = 1
        
        borderView?.layer.cornerRadius = 12
        borderView?.clipsToBounds = true
        contentView.addSubview(borderView!)
        
        NSLayoutConstraint.activate([
            borderView!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            borderView!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            borderView!.topAnchor.constraint(equalTo: contentView.topAnchor),
            borderView!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        borderView?.alpha = 0
    }
    
    func configure(with paymentGateway: PaymentGateway, isSelected: Bool) {
        paymentNameLabel.text = paymentGateway.name
        paymentImageView.image = UIImage(named: paymentGateway.logo)
        paymentDescriptionLabel.text = paymentGateway.details
        toggleBorderVisibility(isSelected: isSelected)
    }
    
    private func toggleBorderVisibility(isSelected: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.borderView?.alpha = isSelected ? 1 : 0
        }
    }
    
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCell))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapCell() {
        delegate?.isSelectedPaymentMethod(cell: self)
    }
    
}
