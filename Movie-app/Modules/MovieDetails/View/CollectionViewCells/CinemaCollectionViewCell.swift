//
//  CinemaCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

protocol CinemaSectionCellDelegate: AnyObject {
    func isSelected(cell: CinemaCollectionViewCell)
}

class CinemaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CinemaCollectionViewCell"
    weak var delegate: CinemaSectionCellDelegate?
    
    let cinemaNameLabel = UILabel.createLabel(with: CinemaNameLabelConfiguration())
    let cinemaAddressLabel = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    let cinemaCityLabel = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    private var borderView: UIView?
    let cinemaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        addTapGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = CustomColors.detailsCardBgColor
        contentView.addSubview(cinemaNameLabel)
        contentView.addSubview(cinemaAddressLabel)
        contentView.addSubview(cinemaCityLabel)
        contentView.addSubview(cinemaImageView)
        setUpConstrains()
        addBorderView()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            cinemaNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cinemaNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            cinemaAddressLabel.topAnchor.constraint(equalTo: cinemaNameLabel.bottomAnchor, constant: 16),
            cinemaAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cinemaAddressLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            cinemaCityLabel.topAnchor.constraint(equalTo: cinemaNameLabel.bottomAnchor, constant: 16),
            cinemaCityLabel.leadingAnchor.constraint(equalTo: cinemaAddressLabel.trailingAnchor, constant: 2),
            cinemaCityLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            cinemaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cinemaImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cinemaImageView.heightAnchor.constraint(equalToConstant: 16),
            cinemaImageView.widthAnchor.constraint(equalToConstant: 32)
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
    
    func configure(with cinemaDetails: Cinema, isSelected: Bool) {
        cinemaNameLabel.text = cinemaDetails.name
        cinemaAddressLabel.text = cinemaDetails.address
        cinemaCityLabel.text = cinemaDetails.city
        cinemaImageView.image = UIImage(named: cinemaDetails.logo)
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
        delegate?.isSelected(cell: self)
        print("Tapped detetced from cell")
    }
}
