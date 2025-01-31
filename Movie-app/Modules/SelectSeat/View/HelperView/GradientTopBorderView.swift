//
//  GradientTopBorderView.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import UIKit

class GradientTopBorderView: UIView {
    
    private var topBorderView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUi()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureUi() {
        addGradientLayer()
        addShapeMask()
        addTopBorder()
    }
    
    private func addGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.black.cgColor,
            CustomColors.yellowColor?.withAlphaComponent(0.1).cgColor ?? UIColor.yellow.cgColor, // Top color
        ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.75)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func addShapeMask() {
        let shapePath = UIBezierPath()
        shapePath.move(to: CGPoint(x: 0, y: bounds.height))
        shapePath.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        shapePath.addLine(to: CGPoint(x: bounds.width * 0.9, y: 0))
        shapePath.addLine(to: CGPoint(x: bounds.width * 0.1, y: 0))
        shapePath.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shapePath.cgPath
        layer.mask = shapeLayer
    }
    
    private func addTopBorder() {
        topBorderView = UIView()
        topBorderView.backgroundColor = CustomColors.yellowColor
        topBorderView.frame = CGRect(
            x: bounds.width * 0.1,
            y: 0,
            width: bounds.width * 0.9,
            height: 2
        )
        addSubview(topBorderView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first?.frame = bounds
        addShapeMask()
        topBorderView.frame = CGRect(
            x: bounds.width * 0.1,
            y: 0,
            width: bounds.width * 0.9,
            height: 2
        )
    }
}
