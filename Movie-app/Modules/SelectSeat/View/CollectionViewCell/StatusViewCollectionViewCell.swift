//
//  StatusViewCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

class StatusViewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StatusViewCollectionViewCell"
    
    let statusLabel = UILabel.createLabel(with: MovieDirectorNameLabelConfiguration())
    let statusColorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(statusLabel)
        contentView.addSubview(statusColorView)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            statusColorView.topAnchor.constraint(equalTo: topAnchor),
            statusColorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            statusColorView.heightAnchor.constraint(equalToConstant: 24),
            statusColorView.widthAnchor.constraint(equalToConstant: 24),
            
            statusLabel.leadingAnchor.constraint(equalTo: statusColorView.trailingAnchor, constant: 8),
            statusLabel.topAnchor.constraint(equalTo: topAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with seatStatus: ReservationStatus) {
        statusLabel.text = seatStatus.title
        statusColorView.backgroundColor = UIColor(named: seatStatus.backgroundColor)
    }
    
}
