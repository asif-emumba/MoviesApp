//
//  MovieCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import UIKit

protocol MoviesSectionCellDelegate: AnyObject {
    func movieCollectionViewCellDidSelect(cell: MovieCollectionViewCell)
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MoviesSectionCell"
    weak var delegate: MoviesSectionCellDelegate?
    
    private let movieName = UILabel.createLabel(with: MovieNameLabelConfiguration())
    private let movieInfoLabel = UILabel.createLabel(with: MovieDurationLabelConfiguration())
    private let movieRatingLabel = UILabel.createLabel(with: MovieRatingLabelConfiguration())
    
    private let ratingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let starIcon: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.IcStar)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
        configureActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            // Poster image layout
            posterImage.topAnchor.constraint(equalTo: topAnchor),
            posterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterImage.heightAnchor.constraint(equalToConstant: 440),
            // Movie name layout
            movieName.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 16),
            movieName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            // Movie info label layout like runtime and genres
            movieInfoLabel.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 16),
            movieInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            // Rating view layout
            ratingView.topAnchor.constraint(equalTo: movieInfoLabel.bottomAnchor, constant: 10),
            ratingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            starIcon.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            starIcon.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            starIcon.widthAnchor.constraint(equalToConstant: 16),
            starIcon.heightAnchor.constraint(equalToConstant: 16),
            
            movieRatingLabel.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 4),
            movieRatingLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            movieRatingLabel.trailingAnchor.constraint(equalTo: ratingView.trailingAnchor)
        ])
    }
    
    private func configureUi() {
        contentView.backgroundColor = CustomColors.backgroundColor
        contentView.addSubview(posterImage)
        contentView.addSubview(movieName)
        contentView.addSubview(movieInfoLabel)
        contentView.addSubview(ratingView)
        ratingView.addSubview(starIcon)
        ratingView.addSubview(movieRatingLabel)
        setUpConstraints()
    }
    
    func configure(with movie: MovieDetails) {
        if let posterURL = movie.posterURL {
            posterImage.loadImage(from: posterURL.absoluteString)
        }
            // Calculate hours and minutes
        let hours = movie.runtime / 60
        let minutes = movie.runtime % 60
        let formattedRuntime = "\(hours)h\(minutes)m"
            // Format runtime and genres
        let genreNames = movie.genres.map { $0.name }.joined(separator: ", ")
        movieInfoLabel.text = "\(formattedRuntime) • \(genreNames)"
            // Configure other labels
        movieName.text = movie.title
        movieRatingLabel.text = String(format: "%.1f", movie.voteAverage)
    }
    
    private func configureActions() {
        isUserInteractionEnabled = true
        posterImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(posterImageViewTapped)))
    }
    
    @objc private func posterImageViewTapped() {
        delegate?.movieCollectionViewCellDidSelect(cell: self)
    }
}


