//
//  NowPlayingMoviesRequest.swift
//  Movie-app
//
//  Created by Asif-emumba on 22/01/2025.
//

struct NowPlayingMoviesRequest: DataRequest {
    typealias Response = MoviesResponse
    
    let endpoint: EndPoints
    
    var path: String {
        return "/3/\(endpoint.rawValue)"
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var queryItems: [String: String] {
        return [:]
    }
}


