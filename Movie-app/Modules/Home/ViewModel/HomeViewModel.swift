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
    
    // MARK: - Fetch Movies
    func fetchMovies(from endpoint: EndPoints) async throws -> [Movies] {
        let request = NowPlayingMoviesRequest(endpoint: endpoint)
        let response = try await NetworkManager.shared.apiRequest(request)
        return response.results
    }
    
    // MARK: - Fetch Movie Details
    func fetchMovieDetails(movieId: Int) async throws -> MovieDetails {
        let request = MovieDetailsRequest(movieId: movieId)
        return try await NetworkManager.shared.apiRequest(request)
    }
    
    // MARK: - Fetch Movies with Details
    func fetchMoviesAsync(from endpoint: EndPoints) async throws -> [MovieDetails] {
        let movies = try await fetchMovies(from: endpoint)
        
        var detailedMovies: [MovieDetails] = []
        for movie in movies {
            let details = try await fetchMovieDetails(movieId: movie.id)
            detailedMovies.append(details)
        }
        return detailedMovies
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
            NowPlayingMovieSection(
                headerTitle: "Now playing",
                items: movies.map { NowPlayingMovieSectionCellItem(item: $0, delegate: movieCellDelegate) }
            )
        ]
        delegate?.reloadMovieData()
    }
    
}

