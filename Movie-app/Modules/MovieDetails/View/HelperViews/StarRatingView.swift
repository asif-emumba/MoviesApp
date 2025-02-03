//
//  StarRatingView.swift
//  Movie-app
//
//  Created by Asif-emumba on 24/01/2025.
//

import UIKit

class StarRatingView: UIView {
    private let totalStars = 5
    private var starImageViews: [UIImageView] = []
    
    var starSize: CGFloat = 32 // Base size (for large screens)
    let minStarSize: CGFloat = 16 // Minimum size (for small screens)
    var spacing: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStars()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStars() {
        starImageViews.forEach { $0.removeFromSuperview() }
        starImageViews.removeAll()
        
        for _ in 0..<totalStars {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = Assets.Icons.icStar
            imageView.tintColor = .gray
            imageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
            starImageViews.append(imageView)
        }
        
        layoutStars()
    }
    
    private func layoutStars() {
        guard !starImageViews.isEmpty else { return }
        
        let availableWidth = bounds.width - CGFloat(totalStars - 1) * spacing
        let calculatedStarSize = min(starSize, max(minStarSize, availableWidth / CGFloat(totalStars)))
        
        var previousStar: UIImageView?
        for star in starImageViews {
            NSLayoutConstraint.deactivate(star.constraints)
            NSLayoutConstraint.activate([
                star.widthAnchor.constraint(equalToConstant: calculatedStarSize),
                star.heightAnchor.constraint(equalToConstant: calculatedStarSize),
                star.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
            
            if let previous = previousStar {
                star.leadingAnchor.constraint(equalTo: previous.trailingAnchor, constant: spacing).isActive = true
            } else {
                star.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            }
            
            previousStar = star
        }
    }
    
    func setRating(_ rating: Int) {
        starImageViews.enumerated().forEach { index, star in
            star.tintColor = index < rating ? .yellow : .gray
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutStars()
    }

    override var intrinsicContentSize: CGSize {
        let width = CGFloat(totalStars) * starSize + CGFloat(totalStars - 1) * spacing
        return CGSize(width: width, height: starSize)
    }
}
