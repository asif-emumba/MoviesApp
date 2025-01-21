    //
    //  NetworkManager.swift
    //  Movie-app
    //
    //  Created by Emumba on 18/01/2025.
    //

import Foundation

class ApiService {
    
    static let shared = ApiService()
        //generic funtion for api call//
    func getRequest<T: Codable>(
        url: URL?,
        expecting: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let url = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else{
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkError.noData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
        //generic function for post api
    func postRequest<T: Codable, U: Codable>(
        url: URL?,
        body: T,
        expecting: U.Type,
        completion: @escaping (Result<U, Error>) -> Void
    ) {
        guard let url = url else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NetworkError.noData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
}
