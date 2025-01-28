//
//  ImageView+Extension.swift
//  Movie-app
//
//  Created by Emumba on 18/01/2025.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.kf.setImage(with: url)
    }
}

