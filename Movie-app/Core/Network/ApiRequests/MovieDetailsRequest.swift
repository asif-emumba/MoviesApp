//
//  MovieDetailsRequest.swift
//  Movie-app
//
//  Created by Asif-emumba on 22/01/2025.
//

struct MovieDetailsRequest: DataRequest {
    typealias Response = MovieDetails
    
    let movieId: Int
    
    var path: String {
        return "/3/movie/\(movieId)"
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var queryItems: [String: String] {
        return [:]
    }
}

