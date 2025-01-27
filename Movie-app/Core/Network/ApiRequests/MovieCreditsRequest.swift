//
//  MovieCreditsRequest.swift
//  Movie-app
//
//  Created by Asif-emumba on 26/01/2025.
//

import Foundation

struct MovieCreditsRequest: DataRequest {
    typealias Response = CreditResponse
    
    let movieId: Int
    
    var path: String {
        return "/3/movie/\(movieId)/credits"
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var queryItems: [String: String] {
        return [:]
    }
}
