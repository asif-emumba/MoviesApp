//
//  HomeViewModel.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation

protocol MovieHomeControllerViewModelDelegate: AnyObject {
    func reloadMovieData()
}

class HomeViewModel {
    var sections: [CollectionViewSection] = []
    var nowPlayingMovies: [MovieDetails] = []
    
    weak var delegate: MovieHomeControllerViewModelDelegate?
    weak var movieCellDelegate: MovieCollectionViewCellItemDelegate?

        // MARK: - Fetch Movies from api
    private func fetchMovies(from endpoint: EndPoints, completion: @escaping ([Movies]?, Error?) -> Void) {
        let urlString = "\(APIConstants.APIBaseURL)/\(endpoint.rawValue)?api_key=\(APIConstants.apiKey)"
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.invalidURL)
            return
        }
        
        ApiService.shared.getRequest(url: url, expecting: MoviesResponse.self) { result in
            switch result {
                case .success(let response):
                    completion(response.results, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
    
        // MARK: - Fetch Single Movie Details
    private func fetchMovieDetails(movieId: Int, completion: @escaping (MovieDetails?, Error?) -> Void) {
        let urlString = "\(APIConstants.APIBaseURL)/movie/\(movieId)?api_key=\(APIConstants.apiKey)"
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.invalidURL)
            return
        }
        
        ApiService.shared.getRequest(url: url, expecting: MovieDetails.self) { result in
            switch result {
                case .success(let movieDetails):
                    completion(movieDetails, nil)
                case .failure(let error):
                    completion(nil, error)
            }
        }
    }
    
        // MARK: - Async Fetch Movies first then asign the movies id to fethc its details
    func fetchMoviesAsync(from endpoint: EndPoints) async throws -> [MovieDetails] {
        let movies = try await withCheckedThrowingContinuation { continuation in
            fetchMovies(from: endpoint) { movies, error in
                if let movies = movies {
                    continuation.resume(returning: movies)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: NetworkError.invalidResponse)
                }
            }
        }
        
        for movie in movies {
            let movieDetails = try await withCheckedThrowingContinuation { continuation in
                fetchMovieDetails(movieId: movie.id) { details, error in
                    if let details = details {
                        continuation.resume(returning: details)
                    } else if let error = error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume(throwing: NetworkError.invalidResponse)
                    }
                }
            }
            
            if !nowPlayingMovies.contains(where: { $0.id == movieDetails.id }) {
                nowPlayingMovies.append(movieDetails)
            }
        }
        
        return nowPlayingMovies
    }
    
    
    func fetchMoviesByCategory(category: MovieCategoryName) {
        Task { @MainActor in
            do {
                switch category {
                    case .nowPlaying:
                        nowPlayingMovies = try await fetchMoviesAsync(from: .nowPlaying)
                    case .upcoming:
                        print("Fetching upcoming movies (not implemented)")
                }
                populateSections(with: nowPlayingMovies)
                delegate?.reloadMovieData()
            } catch {
                print("Failed to fetch movies for category \(category): \(error)")
            }
        }
    }
    
            // MARK: - Populate Sections
    private func populateSections(with movies: [MovieDetails]) {
        let userGreeting = "Hi, Angelina 👋"
        sections = [
            UserInfoSection(headerTitle: "", items: [UserInfoSectionCellItem(item: userGreeting)]),
            MoviesSection(
                headerTitle: "Now playing",
                items: movies.map { MoviesCellItem(item: $0, delegate: movieCellDelegate) }
            )
        ]
        delegate?.reloadMovieData()
    }

}

