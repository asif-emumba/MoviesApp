//
//  NetworkManager.swift
//  Movie-app
//
//  Created by Emumba on 18/01/2025.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    //generic funtion for api call//
    func apiRequest<T: DataRequest>(
        _ request: T
    ) async throws -> T.Response {
        do {
            let urlRequest = try request.createURLRequest()
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidResponse
            }
            
            return try request.decode(data)
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
