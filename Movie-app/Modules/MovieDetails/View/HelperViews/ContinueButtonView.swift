//
//  ContinueButtonView.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

protocol ContinueButtonViewDelegate: AnyObject {
    func continueButtonTapped()
}

class ContinueButtonView: UIView {

    weak var delegate: ContinueButtonViewDelegate?
    
    private let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = CustomColors.yellowColor
        button.layer.cornerRadius = 28
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(continueButton)
        NSLayoutConstraint.activate([
            continueButton.topAnchor.constraint(equalTo: topAnchor),
            continueButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureActions() {
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    @objc private func continueButtonTapped() {
        delegate?.continueButtonTapped()
    }
    
}
