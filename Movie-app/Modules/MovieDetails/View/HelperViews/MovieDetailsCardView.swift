//
//  MovieDetailsCardView.swift
//  Movie-app
//
//  Created by Asif-emumba on 24/01/2025.
//

import UIKit

class MovieDetailsCardView: UIView {
    
    let movieTitleLabel = UILabel.createLabel(with: MovieDetailsNameLabelConfiguration())
    let movieInfoLabel = UILabel.createLabel(with: MovieDetailsInfoLabelConfiguration())
    let movieReviewLabel = UILabel.createLabel(with: MovieDetailsLabelConfiguration())
    let ratingLabel = UILabel.createLabel(with: MovieDetailsLabelConfiguration())
    
    let ratingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let starViews: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let ratingStartImageView = StarRatingView(frame: .zero)

    let starIcon: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icStar)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let watchTrailerButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.layer.cornerRadius = 4
        button.layer.borderColor = CustomColors.subHeadingColor!.cgColor
        button.layer.borderWidth = 1.5
        button.layer.masksToBounds = true
        button.setImage(Assets.Icons.icPlay, for: .normal)
        button.setTitle("  Watch trailer", for: .normal)
        button.setTitleColor(CustomColors.subHeadingColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        addSubview(movieTitleLabel)
        addSubview(movieInfoLabel)
        addSubview(starViews)
        addSubview(ratingView)
        ratingView.addSubview(movieReviewLabel)
        ratingView.addSubview(starIcon)
        ratingView.addSubview(ratingLabel)
        starViews.addSubview(ratingStartImageView)
        starViews.addSubview(watchTrailerButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            movieTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            movieTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            // movie info label
            movieInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            movieInfoLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 12),
            movieInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            // movie review label
            ratingView.topAnchor.constraint(equalTo: movieInfoLabel.bottomAnchor, constant: 40),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ratingView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            movieReviewLabel.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            movieReviewLabel.topAnchor.constraint(equalTo: ratingView.topAnchor),
            movieReviewLabel.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor),
            movieReviewLabel.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            // rating star
            starIcon.topAnchor.constraint(equalTo: ratingView.topAnchor),
            starIcon.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            starIcon.leadingAnchor.constraint(equalTo: movieReviewLabel.trailingAnchor, constant: 6),
            // rating label
            ratingLabel.topAnchor.constraint(equalTo: ratingView.topAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: starIcon.trailingAnchor, constant: 6),
            ratingLabel.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            // rating views
            starViews.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            starViews.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            starViews.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            starViews.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 12),
            starViews.heightAnchor.constraint(equalToConstant: 34),
            // rating stars
            ratingStartImageView.topAnchor.constraint(equalTo: starViews.topAnchor),
            ratingStartImageView.leadingAnchor.constraint(equalTo: starViews.leadingAnchor),
            ratingStartImageView.bottomAnchor.constraint(equalTo: starViews.bottomAnchor),
            // trailer button
            watchTrailerButton.topAnchor.constraint(equalTo: starViews.topAnchor),
            watchTrailerButton.leadingAnchor.constraint(equalTo: ratingStartImageView.trailingAnchor, constant: 28),
            watchTrailerButton.trailingAnchor.constraint(equalTo: starViews.trailingAnchor),
            watchTrailerButton.bottomAnchor.constraint(equalTo: starViews.bottomAnchor),
            watchTrailerButton.widthAnchor.constraint(equalToConstant: 110),
        ])
    }
    
    func configure(with movieDetails: MovieDetails) {
        movieTitleLabel.text = movieDetails.title
        // Calculate hours and minutes
        let hours = movieDetails.runtime / 60
        let minutes = movieDetails.runtime % 60
        let formattedRuntime = "\(hours)h\(minutes)m"
        // Format runtime and genres
        let releaseDateString = movieDetails.releaseDate
        movieInfoLabel.text = "\(formattedRuntime) • \(releaseDateString)"
        movieReviewLabel.text = "Review"
        ratingLabel.text = String(format: "%.1f", movieDetails.voteAverage)
    }
    
}
