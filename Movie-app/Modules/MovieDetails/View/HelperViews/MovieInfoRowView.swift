//
//  MovieInfoRowView.swift
//  Movie-app
//
//  Created by Asif-emumba on 25/01/2025.
//

import UIKit

class MovieInfoRowView: UIView {

    let titleLabel = UILabel.createLabel(with: MovieDetailsRow())
    let detailLabel = UILabel.createLabel(with: MovieDetailsLabelConfiguration())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 128),
            
            detailLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            detailLabel.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
    
    func configure(with title: String, detail: String) {
        titleLabel.text = title
        detailLabel.text = detail
    }

}
