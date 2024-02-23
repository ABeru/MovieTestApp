//
//  Movie.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import Foundation

struct Movie: Identifiable {
    let id: UUID
    let title: String
    let year: String
    let genre: String
    let description: String
    
    // MARK: Mock
    static var mock: Self {
        .init(
            id: UUID(),
            title: "1",
            year: "2000",
            genre: "1",
            description: "1"
        )
    }
}
