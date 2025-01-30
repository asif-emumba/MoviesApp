//
//  MovieNews.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import Foundation
import UIKit

struct MovieNews: Codable {
    let id: Int
    let description: String
    let image: String?
}

extension MovieNews {
    static var mockData: [MovieNews] {
        return [
            MovieNews(id: 1, description: "When The Batman 2 Starts Filming Reportedly Revealed", image: Assets.Movie.moviePoster1),
            MovieNews(id: 2, description: "6 Epic Hulk Fights Thats Can Happen In The MCU's Future", image: Assets.Movie.moviePoster2),
        ]
    }
}
