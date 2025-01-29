//
//  MovieCoverView.swift
//  Movie-app
//
//  Created by Asif-emumba on 29/01/2025.
//

import UIKit

class MovieCoverView: UIView {

    let movieGenreLabel = UILabel.createLabel(with: TicketLabelConfiguration())
    let movieDurationLabel = UILabel.createLabel(with: TicketLabelConfiguration())
    let movieNameLabel = UILabel.createLabel(with: MovieTitleLabelConfiguration())
    let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 13
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    let timeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icClock?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = CustomColors.backgroundColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icVideo?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = CustomColors.backgroundColor
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
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(posterImageView)
        addSubview(movieNameLabel)
        addSubview(movieImageView)
        addSubview(timeImageView)
        addSubview(movieGenreLabel)
        addSubview(movieDurationLabel)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 177),
            posterImageView.widthAnchor.constraint(equalToConstant: 125),
            
            movieNameLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16),
            movieNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            movieNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            timeImageView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16),
            timeImageView.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 8),
            timeImageView.widthAnchor.constraint(equalToConstant: 20),
            timeImageView.heightAnchor.constraint(equalToConstant: 20),
            
            movieDurationLabel.leadingAnchor.constraint(equalTo: timeImageView.trailingAnchor, constant: 8),
            movieDurationLabel.topAnchor.constraint(equalTo: movieNameLabel.bottomAnchor, constant: 8),
            movieDurationLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            movieImageView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16),
            movieImageView.topAnchor.constraint(equalTo: timeImageView.bottomAnchor, constant: 8),
            movieImageView.widthAnchor.constraint(equalToConstant: 20),
            movieImageView.heightAnchor.constraint(equalToConstant: 20),
            
            movieGenreLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 8),
            movieGenreLabel.topAnchor.constraint(equalTo: movieDurationLabel.bottomAnchor, constant: 8),
            movieGenreLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func configureView(with movieDetails: MovieDetails) {
        if let posterURL = movieDetails.posterURL {
            posterImageView.loadImage(from: posterURL.absoluteString)
        }
        movieNameLabel.text = movieDetails.title
        let hours = movieDetails.runtime / 60
        let minutes = movieDetails.runtime % 60
        let formattedRuntime = "\(hours)hours \(minutes)minutes"
        movieDurationLabel.text = "\(formattedRuntime)"
        movieGenreLabel.text = movieDetails.genres.map { $0.name }.joined(separator: ", ")
    }

}
