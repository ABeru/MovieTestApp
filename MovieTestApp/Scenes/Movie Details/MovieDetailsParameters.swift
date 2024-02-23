//  
//  MovieDetailsParameters.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import Foundation

// MARK: - MovieDetails Parameters
struct MovieDetailsParameters: Hashable {
    // MARK: Properties
    let movie: Movie
    
    // MARK: Hashable
    func hash(into hasher: inout Hasher) {}
    
    // MARK: Equatable
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    // MARK: Mock
    static var mock: Self {
        .init(movie: .init(id: UUID(), title: "", year: "", genre: "", description: ""))
    }
}
