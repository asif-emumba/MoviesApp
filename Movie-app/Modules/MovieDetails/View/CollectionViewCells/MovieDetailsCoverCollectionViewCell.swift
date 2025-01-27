//
//  MovieDetailsCoverCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 24/01/2025.
//

import UIKit

class MovieDetailsCoverCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieDetailsCoverCollectionViewCell"
    let movieGenreRowView = MovieInfoRowView()
    let movieCensoredRowView = MovieInfoRowView()
    let movieLanguageRowView = MovieInfoRowView()
    let movieDetailsCardView: MovieDetailsCardView = {
        let detailsView = MovieDetailsCardView()
        detailsView.translatesAutoresizingMaskIntoConstraints = false
        detailsView.layer.cornerRadius = 16
        detailsView.layer.masksToBounds = true
        detailsView.backgroundColor = CustomColors.detailsCardBgColor
        return detailsView
    }()
    let movieBackdropImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        addSubview(movieBackdropImage)
        addSubview(movieDetailsCardView)
        addSubview(movieGenreRowView)
        addSubview(movieCensoredRowView)
        addSubview(movieLanguageRowView)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            // backdrop image
            movieBackdropImage.topAnchor.constraint(equalTo: topAnchor),
            movieBackdropImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieBackdropImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieBackdropImage.heightAnchor.constraint(equalToConstant: 241),
            // movie details card view
            movieDetailsCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieDetailsCardView.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -16),
            movieDetailsCardView.topAnchor.constraint(equalTo: movieBackdropImage.bottomAnchor, constant: -90),
            movieDetailsCardView.heightAnchor.constraint(equalToConstant: 194),
            // movie Genre row
            movieGenreRowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieGenreRowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            movieGenreRowView.topAnchor.constraint(equalTo: movieDetailsCardView.bottomAnchor, constant: 32),
            // movie censorship row
            movieCensoredRowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieCensoredRowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            movieCensoredRowView.topAnchor.constraint(equalTo: movieGenreRowView.bottomAnchor, constant: 16),
            // movie language row
            movieLanguageRowView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            movieLanguageRowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            movieLanguageRowView.topAnchor.constraint(equalTo: movieCensoredRowView.bottomAnchor, constant: 16),
        ])
    }
    
    func configure(with movieDetails: MovieDetails) {
        if let backdropURL = movieDetails.backdropURL {
            movieBackdropImage.loadImage(from: backdropURL.absoluteString)
        }
        movieDetailsCardView.configure(with: movieDetails)
        movieGenreRowView.configure(with: "Movie genre:", detail: movieDetails.genres.prefix(3).map { $0.name }.joined(separator: ", "))
        movieCensoredRowView.configure(with: "Censorship:", detail: movieDetails.adult ? "18+" : "13+")
        let languageName = Locale.current.localizedString(forLanguageCode: movieDetails.originalLanguage) ?? "Unknown"
        movieLanguageRowView.configure(with: "Language:", detail: languageName)
    }

}
