//  
//  MovieDetailsView.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import SwiftUI
import VCore

// MARK: - MovieDetails View
struct MovieDetailsView: View {
    // MARK: Properties
    @StateObject private var viewModel: MovieDetailsViewModel

    private typealias UIModel = MovieDetailsUIModel
    private typealias LocStrings = MovieDetailsLocalizedStrings

    @Environment(\.navigationStackCoordinatorOO) private var navigationStackCoordinator: NavigationStackCoordinatorOO!

    @State private var didAppearForTheFirstTime: Bool = false
    
    // MARK: Initializers
    init(parameters: MovieDetailsParameters) {
        self._viewModel = StateObject(wrappedValue: MovieDetailsViewModel(parameters: parameters))
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
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatingNavigationStackOO(root: {
            MovieDetailsView(parameters: .mock)
        })
    }
}
