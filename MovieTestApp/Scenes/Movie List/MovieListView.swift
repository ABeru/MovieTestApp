//  
//  MovieListView.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import SwiftUI

// MARK: - MovieList View
struct MovieListView: View {
    // MARK: Properties
    @State private var viewModel: MovieListViewModel

    private typealias UIModel = MovieListUIModel

    @Environment(\.navigationStackCoordinator) private var navigationStackCoordinator: NavigationStackCoordinator!
    
    // MARK: Initializers
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Body
    var body: some View {
        ZStack(content: {
            contentView
        })
        .onFirstAppear(perform: {
            viewModel.navigationStackCoordinator = navigationStackCoordinator
            viewModel.didLoad()
        })
        .navigationDestination(for: MovieDetailsParameters.self, destination: { MovieDetailsView(parameters: $0)}
        )
    }
    
    private var contentView: some View {
        ScrollView(content: {
            VStack(spacing: UIModel.contentViewSpacing) {
                Spacer().frame(height: UIModel.contentviewMarginVertical)
                
                ForEach(viewModel.movies) { movie in
                    movieCard(title: movie.title, year: movie.year)
                        .onTapGesture {
                            viewModel.didSelectMovie(movie: movie)
                        }
                }
            }
        })
    }
    
    private func movieCard(title: String, year: String) -> some View {
        VStack(alignment: .center, spacing: UIModel.movieDetailsSpacing) {
            Spacer().frame(height: UIModel.movieDetailsMarginVertical)
            
            Text(title)
            
            Text(year)
            
            Spacer().frame(height: UIModel.movieDetailsMarginVertical)
        }
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .clipShape(.rect(cornerRadius: UIModel.movieCardCornerRadius))
        .padding(.horizontal, UIModel.movieCardMarginHorizontal)
    }
}

// MARK: - Preview
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatingNavigationStack(root: {
            MovieListView(viewModel: .init())
        })
    }
}
