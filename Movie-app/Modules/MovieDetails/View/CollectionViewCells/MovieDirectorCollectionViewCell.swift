//
//  MovieDirectorCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 26/01/2025.
//

import UIKit

class MovieDirectorCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieDirectorCollectionViewCell"
    
    let directorNameLabel = UILabel.createLabel(with: MovieDirectorNameLabelConfiguration())
    let directorProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = CustomColors.detailsCardBgColor
        contentView.addSubview(directorNameLabel)
        contentView.addSubview(directorProfileImageView)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            directorProfileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 11),
            directorProfileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            directorProfileImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -11),
            directorProfileImageView.heightAnchor.constraint(equalToConstant: 36),
            directorProfileImageView.widthAnchor.constraint(equalToConstant: 36),
            
            directorNameLabel.leadingAnchor.constraint(equalTo: directorProfileImageView.trailingAnchor, constant: 12),
            directorNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            directorNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            directorNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12)
            
        ])
    }
    
    func configure(with movieDirectors: Cast) {
        directorNameLabel.text = movieDirectors.name
        if let profileImageURL = movieDirectors.profileImageURL {
            directorProfileImageView.loadImage(from: profileImageURL.absoluteString)
        } else {
            directorProfileImageView.image = UIImage(systemName: "person.fill")
        }
    }

}
