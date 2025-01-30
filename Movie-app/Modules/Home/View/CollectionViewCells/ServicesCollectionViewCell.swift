//
//  ServicesCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ServicesCollectionViewCell"
    
    let serviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let serviceLabel = UILabel.createLabel(with: ServicesLabelConfigurations())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        addSubview(serviceImageView)
        addSubview(serviceLabel)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            serviceImageView.topAnchor.constraint(equalTo: topAnchor),
            serviceImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            serviceImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            serviceImageView.heightAnchor.constraint(equalToConstant: 80),
            serviceImageView.widthAnchor.constraint(equalToConstant: 81),
            serviceLabel.topAnchor.constraint(equalTo: serviceImageView.bottomAnchor, constant: 20),
            serviceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            serviceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            serviceLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(with service: Service) {
        serviceLabel.text = service.name
        serviceImageView.image = UIImage(named: service.image!)
    }
    
}
