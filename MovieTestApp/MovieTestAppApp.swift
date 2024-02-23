//
//  MovieTestAppApp.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import SwiftUI

@main
struct MovieTestAppApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatingNavigationStack(root: {
                MovieListView(viewModel: .init())
            })
        }
    }
}
