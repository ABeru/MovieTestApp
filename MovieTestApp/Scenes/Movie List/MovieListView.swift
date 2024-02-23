//  
//  MovieListView.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import SwiftUI
import VCore

// MARK: - MovieList View
struct MovieListView: View {
    // MARK: Properties
    @StateObject private var viewModel: MovieListViewModel

    private typealias UIModel = MovieListUIModel
    private typealias LocStrings = MovieListLocalizedStrings

    @Environment(\.navigationStackCoordinatorOO) private var navigationStackCoordinator: NavigationStackCoordinatorOO!

    @State private var didAppearForTheFirstTime: Bool = false
    
    // MARK: Initializers
    init(parameters: MovieListParameters) {
        self._viewModel = StateObject(wrappedValue: MovieListViewModel(parameters: parameters))
    }
    
    // MARK: Body
    var body: some View {
        ZStack(content: {
            backgroundView
            contentView
        })
        .onFirstAppear($didAppearForTheFirstTime, perform: {
            viewModel.navigationStackCoordinator = navigationStackCoordinator
        })

        .inlineNavigationTitle("???")

        .alert(parameters: $viewModel.alertParameters)
        .progressView(parameters: viewModel.progressViewParameters)
    }
    
    private var backgroundView: some View {
        UIModel.backgroundColor.ignoresSafeArea()
    }
    
    private var contentView: some View {
        EmptyView()
    }
}

// MARK: - Preview
struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatingNavigationStackOO(root: {
            MovieListView(parameters: .mock)
        })
    }
}
