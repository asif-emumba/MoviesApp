//
//  HomeViewModel.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func reloadMovieData()
}

class HomeViewModel {
    var sections: [CollectionViewSection] = []
    var nowPlayingMovies: [MovieDetails] = []
    var upcomingMovies: [MovieDetails] = []
    
    weak var delegate: HomeViewModelDelegate?
    weak var movieCellDelegate: NowPlayingMovieCollectionViewCellItemDelegate?
    weak var upcomingMovieCellDelegate: UpComingMovieCollectionViewCellItemDelegate?
    
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
                        upcomingMovies = try await fetchMoviesAsync(from: .upcoming)
                }
                populateSections(with: nowPlayingMovies, upComingMovies: upcomingMovies)
                delegate?.reloadMovieData()
            } catch {
                print("Failed to fetch movies for category \(category): \(error)")
            }
        }
    }
    
    // MARK: - Populate Sections
    private func populateSections(with movies: [MovieDetails], upComingMovies: [MovieDetails]) {
        let userGreeting = "Hi, Angelina 👋"
        let service = Service.mockData
        let movieNews = MovieNews.mockData

        sections = [
            UserInfoSection(headerTitle: "", items: [UserInfoSectionCellItem(item: userGreeting)]),
            NowPlayingMovieSection(
                headerTitle: "Now playing",
                items: movies.map { NowPlayingMovieSectionCellItem(item: $0, delegate: movieCellDelegate) }
            ),
            UpComingMovieSection(
                headerTitle: "Coming soon",
                items: upComingMovies.map { UpComingMovieSectionCellItem(item: $0, delegate: upcomingMovieCellDelegate) }
            ),
            PromoAndDiscountSection(
                headerTitle: "Promo & Discount",
                items: [PromoAndDiscountSectionCellItem()]
            ),
            ServiceSection(headerTitle: "Service", items: service.map { ServiceSectionCellItem(item: $0) }),
            MovieNewsSection(headerTitle: "Movie news", items: movieNews.map { MovieNewsSectionCellItem(item: $0) })
        ]
        delegate?.reloadMovieData()
    }
    
}

