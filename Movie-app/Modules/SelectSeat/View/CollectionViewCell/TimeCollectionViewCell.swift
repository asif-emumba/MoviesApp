//
//  TimeCollectionViewCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import UIKit

protocol TimeSectionCellDelegate: AnyObject {
    func isSelectedTime(cell: TimeCollectionViewCell)
}

class TimeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TimeCollectionViewCell"
    weak var delegate: TimeSectionCellDelegate?
    
    private let timeLabel = UILabel.createLabel(with: MovieRatingLabelConfiguration())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
        addTapGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        contentView.addSubview(timeLabel)
        contentView.layer.cornerRadius = 18
        contentView.backgroundColor = CustomColors.detailsCardBgColor?.withAlphaComponent(0.6)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    func configure(session: SessionTime, selected: Bool) {
        timeLabel.text = session.formattedTime
        highLightSelected(isSelected: selected)
    }
    
    private func highLightSelected(isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = CustomColors.selectedColor
            contentView.layer.borderColor = CustomColors.yellowColor?.cgColor
            contentView.layer.borderWidth = 1
            contentView.layer.masksToBounds = true
        }
        else {
            contentView.backgroundColor = CustomColors.detailsCardBgColor
            contentView.layer.borderColor = UIColor.clear.cgColor
            contentView.layer.borderWidth = 0
            contentView.layer.masksToBounds = true
        }
    }
    
    private func addTapGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapCell))
        contentView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapCell() {
        delegate?.isSelectedTime(cell: self)
    }
}
