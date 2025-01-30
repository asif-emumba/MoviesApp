//
//  MovieDetailsViewModel.swift
//  Movie-app
//
//  Created by Asif-emumba on 24/01/2025.
//

import Foundation

protocol MovieDetailsViewModelDelegate: AnyObject {
    func reloadMovieDetailsData()
}

class MovieDetailsViewModel {
    
    let movieDetails: MovieDetails
    var sections: [CollectionViewSection] = []
    var movieDirector: [Cast] = []
    var movieActor: [Cast] = []
    var cinemaData: [Cinema] = Cinema.mockData
    
    weak var delegate: MovieDetailsViewModelDelegate?
    weak var movieStoryLineDelegate: MovieStoryLineSectionCellItemDelegate?
    weak var cinemaDelegate: CinemaSectionCellItemDelegate?
    
    init(movieDetails: MovieDetails) {
        self.movieDetails = movieDetails
    }
    
    func fetchMoviCredits(movieId: Int) async throws -> [Cast] {
        let request = MovieCreditsRequest(movieId: movieId)
        let response = try await NetworkManager.shared.apiRequest(request)
        return response.crew
    }
    
    func fetchMovieDetails() {
        Task { @MainActor in
            do {
                // Fetch movie credits
                let movieCredits = try await fetchMoviCredits(movieId: movieDetails.id)
                
                // Filter and remove duplicates for directors and actors
                let directors = movieCredits
                    .filter { $0.knownForDepartment.rawValue == "Directing" }
                    .unique { $0.id }
                movieDirector = directors
                
                let actors = movieCredits
                    .filter { $0.knownForDepartment.rawValue == "Acting" }
                    .unique { $0.id }
                movieActor = actors
                // Populate sections with the filtered directors
                populateSections(director: directors, actor: actors)
                delegate?.reloadMovieDetailsData()
                
            } catch {
                print("Failed to fetch movie cast: \(error.localizedDescription)")
            }
        }
    }

    
    // MARK: - Populate Sections
    func populateSections(director: [Cast], actor: [Cast]) {
        sections = [
            MovieDetailsCoverSection(headerTitle: "", items: [MovieDetailsCoverSectionCellItem(item: movieDetails)]),
            MovieStoryLineSection(headerTitle: "Storyline", items: [MovieStoryLineSectionCellItem(item: movieDetails, delegate: movieStoryLineDelegate)]),
            MovieDirectorSection(headerTitle: "Director", items: director.map {MovieDirectorSectionCellItem(item: $0) }),
            MovieActorSection(headerTitle: "Actor", items: actor.map { MovieActorSectionCellItem(item: $0) }),
            CinemaSection(
                headerTitle: "Cinema",
                items: cinemaData.map {
                    CinemaSectionCellItem(item: $0, isSelected: $0.isSelected, delegate: cinemaDelegate)
                })
        ]
        delegate?.reloadMovieDetailsData()
    }
    
    // Function to handle selection change
    func updateSelectedCinema(to index: Int) {
        // Deselect all cinemas
        for i in 0..<cinemaData.count {
            cinemaData[i].isSelected = false
        }
        
        // Select the clicked cinema
        cinemaData[index].isSelected = true
        
        // Update the sections to reflect the new selection
        populateSections(director: movieDirector, actor: movieActor)
    }
    
}
