//
//  PromoAndDiscountCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import UIKit

class PromoAndDiscountCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromoAndDiscountCollectionViewCell"
    let promoImageView: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icPromo)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(promoImageView)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            promoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            promoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            promoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            promoImageView.heightAnchor.constraint(equalToConstant: 224)
        ])
    }
    
}
