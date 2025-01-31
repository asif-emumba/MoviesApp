//
//  AppBarView.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

protocol AppBarDelegate: AnyObject {
    func didTapBackButton()
}

class AppBarView: UIView {
    
    weak var delegate: AppBarDelegate?
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        let image = Assets.Icons.icBackArrow?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel = UILabel.createLabel(with: AppBarLabelConfiguration())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        configureAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear // Transparent background
        addSubview(backButton)
        addSubview(titleLabel)
        
        // Set constraints for backButton and titleLabel
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
    }
    
    private func configureAction() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        delegate?.didTapBackButton()
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}
