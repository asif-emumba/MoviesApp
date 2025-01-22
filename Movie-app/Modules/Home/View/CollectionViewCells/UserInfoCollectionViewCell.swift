//
//  UserInfoCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 20/01/2025.
//

import UIKit

class UserInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "WelcomeUserCollectionViewCell"
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = CustomColors.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let notificationIcon: UIImageView = {
        let imageView = UIImageView(image: Assets.Icons.icNotification)
        imageView.tintColor = CustomColors.textColor
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textColor = CustomColors.textColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    func configure(with: String) {
        userNameLabel.text = with
        welcomeLabel.text = "Welcome back"
       
    }
    
    private func configureUi(){
        contentView.addSubview(userNameLabel)
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(notificationIcon)
        contentView.backgroundColor = CustomColors.backgroundColor
        setUpConstrains()
    }
    
    func setUpConstrains() {
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            welcomeLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 12),
            welcomeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            notificationIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            notificationIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            notificationIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            notificationIcon.widthAnchor.constraint(equalToConstant: 36)
        ])
        
    }
}
