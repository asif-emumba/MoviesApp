//
//  UpComingMovieCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 21/01/2025.
//

import UIKit

protocol UpComingMovieCollectionViewCellDelegate: AnyObject {
    func upComingMovieCollectionViewCellDidSelect(cell: UpComingMovieCollectionViewCell)
}
class UpComingMovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "UpComingMovieCollectionViewCell"
    weak var delegate: UpComingMovieCollectionViewCellDelegate?
    
    private let movieName = UILabel.createLabel(with: UpComingMovieNameLabelConfiguration())
    private let movieInfoLabel = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    private let movieReleaseDate = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    
    private let ratingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let calendarIcon: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.IcCalendar)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let genreIcon: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.IcVideo)
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
            posterImage.heightAnchor.constraint(equalToConstant: 244),
            // Movie name layout
            movieName.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 16),
            movieName.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor),
            // Movie info label layout like runtime and genres
            genreIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            genreIcon.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 12),
            movieInfoLabel.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 12),
            movieInfoLabel.leadingAnchor.constraint(equalTo: genreIcon.trailingAnchor, constant: 8),
            movieInfoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            // Rating view layout
            ratingView.topAnchor.constraint(equalTo: movieInfoLabel.bottomAnchor, constant: 12),
            ratingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            calendarIcon.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor),
            calendarIcon.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            calendarIcon.widthAnchor.constraint(equalToConstant: 16),
            calendarIcon.heightAnchor.constraint(equalToConstant: 16),
            
            movieReleaseDate.leadingAnchor.constraint(equalTo: calendarIcon.trailingAnchor, constant: 8),
            movieReleaseDate.centerYAnchor.constraint(equalTo: ratingView.centerYAnchor),
            movieReleaseDate.trailingAnchor.constraint(equalTo: ratingView.trailingAnchor)
        ])
    }
    
    private func configureUi() {
        contentView.addSubview(posterImage)
        contentView.addSubview(movieName)
        contentView.addSubview(movieInfoLabel)
        contentView.addSubview(ratingView)
        contentView.addSubview(genreIcon)
        ratingView.addSubview(calendarIcon)
        ratingView.addSubview(movieReleaseDate)
        setUpConstraints()
    }
    
    func configure(with movie: MovieDetails) {
        if let posterURL = movie.posterURL {
            posterImage.loadImage(from: posterURL.absoluteString)
        }
        
            // Format runtime and genres
        let genreNames = movie.genres.prefix(2).map { $0.name }.joined(separator: ", ")
        movieInfoLabel.text = "\(genreNames)"
            // Configure other labels
        movieName.text = movie.title
        movieReleaseDate.text = movie.releaseDate
    }
    
    private func configureActions() {
        isUserInteractionEnabled = true
        posterImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(posterImageViewTapped)))
    }
    
    @objc private func posterImageViewTapped() {
        delegate?.upComingMovieCollectionViewCellDidSelect(cell: self)
    }
    
}
