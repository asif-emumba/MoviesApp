//
//  DateCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

protocol DateSectionCellDelegate: AnyObject {
    func isSelectedDate(cell: DateCollectionViewCell)
}

class DateCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DateCollectionViewCell"
    weak var delegate: DateSectionCellDelegate?
    
    private let monthLabel = UILabel.createLabel(with: MovieRatingLabelConfiguration())
    private let dateLabel = UILabel.createLabel(with: MovieRatingLabelConfiguration())
    private let dateView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 22
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColors.detailsCardBgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
        addTapGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        contentView.addSubview(monthLabel)
        contentView.addSubview(dateView)
        dateView.addSubview(dateLabel)
        contentView.layer.cornerRadius = 26
        contentView.backgroundColor = CustomColors.detailsCardBgColor?.withAlphaComponent(0.6)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            monthLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            monthLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            monthLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -3),
            
            dateView.topAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: 16),
            dateView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateView.widthAnchor.constraint(equalToConstant: 44),
            dateView.heightAnchor.constraint(equalToConstant: 44),
            
            dateLabel.centerXAnchor.constraint(equalTo: dateView.centerXAnchor),
            dateView.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            
        ])
    }
    
    func configure(session: Session, selected: Bool) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        monthLabel.text = dateFormatter.string(from: session.date)
        dateFormatter.dateFormat = "d"
        dateLabel.text = dateFormatter.string(from: session.date)
        highLightSelected(isSelected: selected)
    }
    
    private func highLightSelected(isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = CustomColors.yellowColor
            monthLabel.textColor = CustomColors.backgroundColor
        }
        else {
            contentView.backgroundColor = CustomColors.detailsCardBgColor?.withAlphaComponent(0.6)
            monthLabel.textColor = CustomColors.textColor
        }
    }
    
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCell))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapCell() {
        delegate?.isSelectedDate(cell: self)
        print("Tapped detetced from cell")
    }
}

