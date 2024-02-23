//  
//  MovieDetailsView.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import SwiftUI

// MARK: - MovieDetails View
struct MovieDetailsView: View {
    // MARK: Properties
    private var movie: Movie = .mock

    private typealias UIModel = MovieDetailsUIModel

    @Environment(\.navigationStackCoordinator) private var navigationStackCoordinator: NavigationStackCoordinator!
    
    // MARK: Initializers
    init(parameters: MovieDetailsParameters) {
        self.movie = parameters.movie
    }
    
    // MARK: Body
    var body: some View {
        ZStack(content: {
            contentView
        })
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var contentView: some View {
        VStack(alignment: .center, spacing: UIModel.contentViewSpacing) {
            Spacer().frame(height: UIModel.contentViewMarginVertical)
            
            Text(movie.title)
            
            Text(movie.year)
            
            Text(movie.genre)
            
            Text(movie.description)
            
            Spacer().frame(height: UIModel.contentViewMarginVertical)
        }
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .clipShape(.rect(cornerRadius: UIModel.contentViewCornerRadius))
        .padding(.horizontal, UIModel.contentViewMarginHorizontal)
    }
}

// MARK: - Preview
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatingNavigationStack(root: {
            MovieDetailsView(parameters: .mock)
        })
    }
}
