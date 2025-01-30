//
//  NetworkError.swift
//  Movie-app
//
//  Created by Emumba on 18/01/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case noData
    case decodingError(Error)
    case serverError(String)
    case invalidResponse
    
    var localizedDescription: String {
        switch self {
            case .invalidURL:
                return "Invalid URL"
            case .requestFailed(let error):
                return "Request failed: \(error.localizedDescription)"
            case .noData:
                return "No data received"
            case .decodingError(let error):
                return "Decoding error: \(error.localizedDescription)"
            case .serverError(let message):
                return "Server error: \(message)"
            case .invalidResponse:
                return "Invalid response"
        }
    }
}

