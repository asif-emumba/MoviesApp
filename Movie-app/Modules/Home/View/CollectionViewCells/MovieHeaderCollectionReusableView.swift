//
//  MovieHeaderCollectionReusableView.swift
//  Movie-app
//
//  Created by Asif-emumba on 20/01/2025.
//

import UIKit

class MoviesSectionHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "MoviesSectionHeaderView"
    private let titleLabel = UILabel.createLabel(with: UpcomingMovieHeaderLabelConfiguration())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
}

