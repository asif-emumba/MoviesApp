//
//  PaymentMovieCoverCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import UIKit

class PaymentMovieCoverCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PaymentMovieCoverCollectionViewCell"
    
    let movieTitleLabel = UILabel.createLabel(with: PosterMovieNameLabelConfiguration())
    let movieGenreLabel = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    let movieCinemaLabel = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    let movieTimeLabel = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let genreIconImageView: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icVideo)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let locationIconImageView: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icLocation?.withRenderingMode(.alwaysTemplate))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = CustomColors.textColor
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let timeIconImageView: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icClock)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let movieInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        contentView.backgroundColor = CustomColors.detailsCardBgColor
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieInfoView)
        movieInfoView.addSubview(movieTitleLabel)
        movieInfoView.addSubview(movieGenreLabel)
        movieInfoView.addSubview(movieCinemaLabel)
        movieInfoView.addSubview(movieTimeLabel)
        movieInfoView.addSubview(genreIconImageView)
        movieInfoView.addSubview(timeIconImageView)
        movieInfoView.addSubview(locationIconImageView)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            movieInfoView.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16),
            movieInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieInfoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19),
            movieInfoView.topAnchor.constraint(equalTo: topAnchor, constant: 19),
            movieInfoView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            movieTitleLabel.leadingAnchor.constraint(equalTo: movieInfoView.leadingAnchor),
            movieTitleLabel.topAnchor.constraint(equalTo: movieInfoView.topAnchor),
            movieTitleLabel.trailingAnchor.constraint(equalTo: movieInfoView.trailingAnchor),
            
            genreIconImageView.leadingAnchor.constraint(equalTo: movieInfoView.leadingAnchor),
            genreIconImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 20),
            genreIconImageView.heightAnchor.constraint(equalToConstant: 16),
            genreIconImageView.widthAnchor.constraint(equalToConstant: 16),
            
            movieGenreLabel.leadingAnchor.constraint(equalTo: genreIconImageView.trailingAnchor, constant: 8),
            movieGenreLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 20),
            movieGenreLabel.trailingAnchor.constraint(equalTo: movieInfoView.trailingAnchor),
            
            locationIconImageView.topAnchor.constraint(equalTo: genreIconImageView.bottomAnchor, constant: 8),
            locationIconImageView.leadingAnchor.constraint(equalTo: movieInfoView.leadingAnchor),
            locationIconImageView.heightAnchor.constraint(equalToConstant: 16),
            locationIconImageView.widthAnchor.constraint(equalToConstant: 16),
            
            movieCinemaLabel.leadingAnchor.constraint(equalTo: locationIconImageView.trailingAnchor, constant: 8),
            movieCinemaLabel.topAnchor.constraint(equalTo: movieGenreLabel.bottomAnchor, constant: 10),
            movieCinemaLabel.trailingAnchor.constraint(equalTo: movieInfoView.trailingAnchor),
            
            timeIconImageView.leadingAnchor.constraint(equalTo: movieInfoView.leadingAnchor),
            timeIconImageView.topAnchor.constraint(equalTo: locationIconImageView.bottomAnchor, constant: 8),
            timeIconImageView.heightAnchor.constraint(equalToConstant: 16),
            timeIconImageView.widthAnchor.constraint(equalToConstant: 16),
            movieTimeLabel.leadingAnchor.constraint(equalTo: timeIconImageView.trailingAnchor, constant: 8),
            movieTimeLabel.topAnchor.constraint(equalTo: movieCinemaLabel.bottomAnchor, constant: 10),
            movieTimeLabel.trailingAnchor.constraint(equalTo: movieInfoView.trailingAnchor)
            
        ])
    }
    
    func configure(with movieInfo: MovieInfo) {
        if let posterUrl = movieInfo.movieDetails.posterURL {
            moviePosterImageView.loadImage(from: posterUrl.absoluteString)
        }
        movieTitleLabel.text = movieInfo.movieDetails.title
        let genreNames = movieInfo.movieDetails.genres.prefix(3).map { $0.name }.joined(separator: ", ")
        movieGenreLabel.text = "\(genreNames)"
        movieCinemaLabel.text = movieInfo.cinemaDetails.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yyyy"
        let formattedDate = dateFormatter.string(from: movieInfo.selectedDate.date)
        movieTimeLabel.text = "\(formattedDate) • \(movieInfo.selectedTime.formattedTime)"
    }
    
}
