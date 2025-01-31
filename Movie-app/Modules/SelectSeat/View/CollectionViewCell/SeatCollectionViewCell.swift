//
//  SeatCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

protocol SeatCollectionViewCellDelegate: AnyObject {
    func seatCollectionViewCellDidSelect(cell: SeatCollectionViewCell)
}

class SeatCollectionViewCell: UICollectionViewCell {
    static let identifier = "SeatCollectionViewCell"
    weak var delegate: SeatCollectionViewCellDelegate?
    
    private let seatButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        button.setTitleColor(CustomColors.textColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        contentView.addSubview(seatButton)
        setUpConstraints()
        configureActions()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            seatButton.topAnchor.constraint(equalTo: topAnchor),
            seatButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            seatButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            seatButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configureActions() {
        seatButton.addTarget(self, action: #selector(seatButtonTapped), for: .touchUpInside)
    }
    
    func configure(with seat: Seat) {
        seatButton.setTitle(seat.id, for: .normal)
        toggleSeatAvailability(isSelected: seat.status)
    }
    
    private func toggleSeatAvailability(isSelected: SeatStatus) {
        switch isSelected {
            case .selected:
                seatButton.backgroundColor = CustomColors.yellowColor
                seatButton.setTitleColor(CustomColors.backgroundColor, for: .normal)
            case .available:
                seatButton.layer.borderColor = UIColor.clear.cgColor
                seatButton.backgroundColor = .clear
                seatButton.setTitleColor(CustomColors.textColor, for: .normal)
            case .reserved:
                seatButton.backgroundColor = CustomColors.selectedColor
                seatButton.setTitleColor(CustomColors.yellowColor, for: .normal)
        }
    }
    
    @objc private func seatButtonTapped() {
        delegate?.seatCollectionViewCellDidSelect(cell: self)
        print("Print detetcted from cell")
    }
}

