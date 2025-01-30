//
//  BuyTicketView.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import UIKit

protocol BuyTimeTicketDelegate: AnyObject {
    func buyTicketButtonTap()
}

class BuyTicketView: UIView {

    weak var delegate: BuyTimeTicketDelegate?
    
    let buyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buy Tickets", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(CustomColors.backgroundColor, for: .normal)
        button.backgroundColor = CustomColors.yellowColor
        button.layer.cornerRadius = 28
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let totalLabel = UILabel.createLabel(with: MovieDetailsInfoLabelConfiguration())
    let priceLabel = UILabel.createLabel(with: PriceLabelConfiguration())
    
    let textView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        addSubview(buyButton)
        addSubview(textView)
        textView.addSubview(totalLabel)
        textView.addSubview(priceLabel)
        setUpConstrains()
        configureAction()
    }
    
    private func setUpConstrains() {
        translatesAutoresizingMaskIntoConstraints = false
        totalLabel.text = "Total"
        priceLabel.adjustsFontForContentSizeCategory = true
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textView.heightAnchor.constraint(equalToConstant: 60),
            
            totalLabel.topAnchor.constraint(equalTo: textView.topAnchor),
            totalLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: textView.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 12),
            priceLabel.leadingAnchor.constraint(equalTo: textView.leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: textView.bottomAnchor),
            
            buyButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buyButton.widthAnchor.constraint(lessThanOrEqualToConstant: 191),
            buyButton.heightAnchor.constraint(equalToConstant: 56),
            
        ])
    }
    
    private func configureAction() {
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    @objc private func buyButtonTapped() {
        delegate?.buyTicketButtonTap()
    }
    
    func setPriceLabel(price: String) {
        priceLabel.text = price
    }
}
