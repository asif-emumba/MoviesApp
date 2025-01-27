//
//  MovieStoryLineCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 25/01/2025.
//

import UIKit

protocol MovieStoryLineSectionCellDelegate: AnyObject {
    func didTapOnMoreButton(in cell: MovieStoryLineCollectionViewCell)
}

class MovieStoryLineCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MovieStoryLineCollectionViewCell"
    weak var delegate: MovieStoryLineSectionCellDelegate?
    let storyLineLabel = UILabel.createLabel(with: MovieStoryLineLabelConfiguration())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        contentView.addSubview(storyLineLabel)
        NSLayoutConstraint.activate([
            storyLineLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            storyLineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storyLineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storyLineLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with storyLine: MovieDetails) {
        storyLineLabel.text = storyLine.overview
    }
    
}
