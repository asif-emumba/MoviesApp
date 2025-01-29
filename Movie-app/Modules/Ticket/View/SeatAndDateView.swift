//
//  SeatAndDateView.swift
//  Movie-app
//
//  Created by Asif-emumba on 29/01/2025.
//

import UIKit

class SeatAndDateView: UIView {

    let timeLabel = UILabel.createLabel(with: CinemaNameTicketLabelConfiguration())
    let dateLabel = UILabel.createLabel(with: CinemaNameTicketLabelConfiguration())
    let sectionLabel = UILabel.createLabel(with: CinemaNameTicketLabelConfiguration())
    let seatLabel = UILabel.createLabel(with: CinemaNameTicketLabelConfiguration())
    let calendarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icCalendar?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = CustomColors.backgroundColor
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let seatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.Icons.icSeat
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUi() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)
        addSubview(dateLabel)
        addSubview(sectionLabel)
        addSubview(calendarImageView)
        addSubview(seatImageView)
        addSubview(seatLabel)
        setUpConstrains()
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            calendarImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            calendarImageView.topAnchor.constraint(equalTo: topAnchor),
            calendarImageView.widthAnchor.constraint(equalToConstant: 48),
            calendarImageView.heightAnchor.constraint(equalToConstant: 48),
            
            timeLabel.topAnchor.constraint(equalTo: topAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 8),
            
            dateLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: calendarImageView.trailingAnchor, constant: 8),
            
            sectionLabel.leadingAnchor.constraint(equalTo: seatImageView.trailingAnchor, constant: 8),
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            
            seatLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            seatLabel.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 10),
            seatLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            seatImageView.topAnchor.constraint(equalTo: topAnchor),
            seatImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            seatImageView.trailingAnchor.constraint(equalTo: seatLabel.leadingAnchor, constant: -8),
            
        ])
    }
    
    func configure(with selectedDate: Session, selectedTime: SessionTime, selectedSeat: [Seat]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM.dd.yyyy"
        let formattedDate = dateFormatter.string(from: selectedDate.date)
        timeLabel.text = selectedTime.formattedTime
        dateLabel.text = formattedDate
        seatLabel.text = selectedSeat.map { $0.id }.joined(separator: ", ")
        sectionLabel.text = "Section 4"
    }
    
}
