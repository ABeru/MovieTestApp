//  
//  MovieListViewModel.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import Foundation
import VCore

// MARK: - MovieList View Model
@MainActor final class MovieListViewModel: ObservableObject {
    // MARK: Properties
    private let parameters: MovieListParameters

    var navigationStackCoordinator: NavigationStackCoordinatorOO!
    @Published var alertParameters: AlertParameters?
    @Published var progressViewParameters: ProgressViewParameters?
    
    // MARK: Initializers
    init(parameters: MovieListParameters) {
        self.parameters = parameters
    }
}
