//
//  DataRequest.swift
//  Movie-app
//
//  Created by Asif-emumba on 22/01/2025.
//

import Foundation

protocol DataRequest {
    associatedtype Response: Decodable
    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [String: String] { get }
    var headers: [String: String] { get }
    var body: [String: Any]? { get }
    
    func decode(_ data: Data) throws -> Response
}

extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

extension DataRequest {
    // Return base url of api
    var baseURL: String {
        return APIConstants.apiBaseUrl
    }
   // Returns query parameters of url if there is any
    var queryItems: [String: String] {
        return [:]
    }
    // Request header
    var headers: [String: String] {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    // Request body only for post or put requests
    var body: [String: Any]? {
        return nil
    }
    // Returns api key
    var apiKey: String {
        return APIConstants.apiKey
    }
    // Making url for request
    var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        
        var allQueryItems = queryItems
        allQueryItems["api_key"] = apiKey
        
        if !allQueryItems.isEmpty {
            components?.queryItems = allQueryItems.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        return components?.url
    }
    // Creating a request
    func createURLRequest() throws -> URLRequest {
        guard let url = url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if method == .POST, let body = body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                throw NetworkError.requestFailed(error)
            }
        }
        
        return request
    }
}

