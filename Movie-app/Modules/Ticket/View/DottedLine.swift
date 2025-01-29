//
//  DottedLine.swift
//  Movie-app
//
//  Created by Asif-emumba on 29/01/2025.
//

import UIKit

class DottedLine: UIView {
    
    private let leftSemiCircle = UIView()
    private let rightSemiCircle = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        leftSemiCircle.backgroundColor = .black
        leftSemiCircle.translatesAutoresizingMaskIntoConstraints = false
        leftSemiCircle.layer.cornerRadius = 24
        leftSemiCircle.layer.masksToBounds = true
        addSubview(leftSemiCircle)
        
        rightSemiCircle.backgroundColor = .black
        rightSemiCircle.translatesAutoresizingMaskIntoConstraints = false
        rightSemiCircle.layer.cornerRadius = 24
        rightSemiCircle.layer.masksToBounds = true
        addSubview(rightSemiCircle)
  
       setUpConstrains()
        bringSubviewToFront(leftSemiCircle)
        bringSubviewToFront(rightSemiCircle)
    }
    
    private func setUpConstrains() {
        NSLayoutConstraint.activate([
            leftSemiCircle.widthAnchor.constraint(equalToConstant: 48),
            leftSemiCircle.heightAnchor.constraint(equalToConstant: 48),
            leftSemiCircle.leadingAnchor.constraint(equalTo: leadingAnchor),
            leftSemiCircle.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            rightSemiCircle.widthAnchor.constraint(equalToConstant: 48),
            rightSemiCircle.heightAnchor.constraint(equalToConstant: 48),
            rightSemiCircle.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightSemiCircle.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath()
        let lineLayer = CAShapeLayer()
        
        let dashPattern: [NSNumber] = [6, 4]
        path.move(to: CGPoint(x: 20, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width - 20, y: rect.midY))
        
        lineLayer.strokeColor = UIColor.gray.cgColor
        lineLayer.lineWidth = 2
        lineLayer.lineDashPattern = dashPattern
        lineLayer.path = path.cgPath
        
        layer.insertSublayer(lineLayer, at: 0)
    }
}



