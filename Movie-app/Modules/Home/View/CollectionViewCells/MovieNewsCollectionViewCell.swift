//
//  MovieNewsCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import UIKit

class MovieNewsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieNewsCollectionViewCell"
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieNewsLabel = UILabel.createLabel(with: MovieDescriptionLabelConfigurations())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        addSubview(movieImageView)
        addSubview(movieNewsLabel)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 135),
            movieNewsLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
            movieNewsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieNewsLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieNewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(with service: MovieNews) {
        movieNewsLabel.text = service.description
        movieImageView.image = UIImage(named: service.image!)
    }

}
