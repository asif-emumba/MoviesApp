//
//  UILable+Extension.swift
//  Movie-app
//
//  Created by Asif-emumba on 20/01/2025.
//

import UIKit

protocol LabelConfigurable {
    var font: UIFont { get }
    var textColor: UIColor { get }
    var textAlignment: NSTextAlignment { get }
    var numberOfLines: Int { get }
    var lineBreakMode: NSLineBreakMode { get }
}

extension LabelConfigurable {
    var numberOfLines: Int { 0 }
    var lineBreakMode: NSLineBreakMode { .byWordWrapping }
}

extension UILabel {
    static func createLabel(with configuration: LabelConfigurable) -> UILabel {
        let label = UILabel()
        label.font = configuration.font
        label.textColor = configuration.textColor
        label.textAlignment = configuration.textAlignment
        label.numberOfLines = configuration.numberOfLines
        label.lineBreakMode = configuration.lineBreakMode
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

