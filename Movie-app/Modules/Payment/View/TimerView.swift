//
//  TimerView.swift
//  Movie-app
//
//  Created by Asif-emumba on 29/01/2025.
//

import UIKit

protocol TimerCompletionDelegate: AnyObject {
    func timerDidComplete()
}

class TimerView: UIView {
    
    weak var delegate: TimerCompletionDelegate?
    
    private var timer: Timer?
    private var timeLeft: Int = 15 * 60
    private let timerMessageLabel = UILabel.createLabel(with: MovieDescriptionLabelConfigurations())
    private let timeLabel = UILabel.createLabel(with: TimerLabelConfiguration())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUi() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        layer.masksToBounds = true
        timeLabel.text = timeFormatted(timeLeft)
        timerMessageLabel.text = "Complete your payment in"
        backgroundColor = CustomColors.selectedColor
        addSubview(timeLabel)
        addSubview(timerMessageLabel)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            timerMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            timerMessageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if timeLeft > 0 {
            timeLeft -= 1
            timeLabel.text = timeFormatted(timeLeft)
        } else {
            timer?.invalidate()
            delegate?.timerDidComplete()
        }
    }
    
    private func timeFormatted(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
}

