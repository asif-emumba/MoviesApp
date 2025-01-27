//
//  StarRatingView.swift
//  Movie-app
//
//  Created by Asif-emumba on 24/01/2025.
//

import UIKit

class StarRatingView: UIView {
    
    private var currentRating: Int = 0
    private let totalStars = 5
    private var starImageViews: [UIImageView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupStars(rating: currentRating)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStars(rating: Int) {
        // Remove old stars before adding new ones
        for imageView in starImageViews {
            imageView.removeFromSuperview()
        }
        starImageViews.removeAll()
        
        // Add stars with tap gestures
        for i in 0..<totalStars {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.tintColor = i < rating ? .yellow : .gray
            imageView.image = Assets.Icons.icStar
            addSubview(imageView)
            starImageViews.append(imageView)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard !bounds.isEmpty else { return }
        
        let starSize = self.bounds.height
        let spacing: CGFloat = 12
        let totalWidth = CGFloat(totalStars) * starSize + CGFloat(totalStars - 1) * spacing
        let startX = (self.bounds.width - totalWidth) / 2
        
        for (index, imageView) in starImageViews.enumerated() {
            let xPosition = startX + CGFloat(index) * (starSize + spacing)
            imageView.frame = CGRect(x: xPosition, y: 0, width: starSize, height: starSize)
        }
    }
}
