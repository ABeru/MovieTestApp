//  
//  MovieListViewModel.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import Foundation
import Observation

// MARK: - MovieList View Model
@Observable
final class MovieListViewModel {
    // MARK: Properties
    var movies: [Movie] = []
    
    var navigationStackCoordinator: NavigationStackCoordinator!
    
    // MARK: Initializers
    init() {}
    
    // MARK: Lifecycle
    func didLoad() {
        fetchMovies()
    }
    
    // MARK: Methods
    func didSelectMovie(movie: Movie) {
        navigationStackCoordinator.path.append(MovieDetailsParameters(movie: movie))
    }
    
    //MARK: Requests
    private func fetchMovies() {
         movies = [
            .init(
                id: UUID(),
                title: "Forrest Gump",
                year: "1994",
                genre: "Drama",
                description: "The history of the United States from the 1950s to the '70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart."
            ),
            .init(
                id: UUID(),
                title: "Interstellar",
                year: "2014",
                genre: "Sci-fi",
                description: "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans."
            ),
            .init(
                id: UUID(),
                title: "Fight Club",
                year: "1999",
                genre: "Drama",
                description: "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more."
            ),
        ]
    }
}
