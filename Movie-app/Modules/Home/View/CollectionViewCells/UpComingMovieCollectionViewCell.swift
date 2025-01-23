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
    private let movieGenre = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    private let movieReleaseDate = UILabel.createLabel(with: UpComingMovieLabelConfigurations())
    
    private let releaseDateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let calendarIcon: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icCalendar)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let videoIcon: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icVideo)
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
            // Movie genres
            videoIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoIcon.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 12),
            movieGenre.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 12),
            movieGenre.leadingAnchor.constraint(equalTo: videoIcon.trailingAnchor, constant: 8),
            movieGenre.trailingAnchor.constraint(equalTo: trailingAnchor),
            // release date view layout
            releaseDateView.topAnchor.constraint(equalTo: movieGenre.bottomAnchor, constant: 12),
            releaseDateView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            calendarIcon.leadingAnchor.constraint(equalTo: releaseDateView.leadingAnchor),
            calendarIcon.centerYAnchor.constraint(equalTo: releaseDateView.centerYAnchor),
            calendarIcon.widthAnchor.constraint(equalToConstant: 16),
            calendarIcon.heightAnchor.constraint(equalToConstant: 16),
            
            movieReleaseDate.leadingAnchor.constraint(equalTo: calendarIcon.trailingAnchor, constant: 8),
            movieReleaseDate.centerYAnchor.constraint(equalTo: releaseDateView.centerYAnchor),
            movieReleaseDate.trailingAnchor.constraint(equalTo: releaseDateView.trailingAnchor)
        ])
    }
    
    private func configureUi() {
        contentView.addSubview(posterImage)
        contentView.addSubview(movieName)
        contentView.addSubview(movieGenre)
        contentView.addSubview(releaseDateView)
        contentView.addSubview(videoIcon)
        releaseDateView.addSubview(calendarIcon)
        releaseDateView.addSubview(movieReleaseDate)
        setUpConstraints()
    }
    
    func configure(with movie: MovieDetails) {
        if let posterURL = movie.posterURL {
            posterImage.loadImage(from: posterURL.absoluteString)
        }
        
        // Format runtime and genres
        let genreNames = movie.genres.prefix(2).map { $0.name }.joined(separator: ", ")
        movieGenre.text = "\(genreNames)"
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
