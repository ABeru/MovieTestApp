//
//  Coordinator.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import SwiftUI

//Source - https://github.com/VakhoKontridze/VCore
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct CoordinatingNavigationStack<Root>: View where Root: View {
    // MARK: Properties
    @State private var navigationStackCoordinator: NavigationStackCoordinator
    private let root: (NavigationStackCoordinator) -> Root

    /// Initializes `CoordinatingNavigationStackOO`.
    public init(
        @ViewBuilder root: @escaping () -> Root
    ) {
        self._navigationStackCoordinator = State(wrappedValue: NavigationStackCoordinator(path: NavigationPath()))
        self.root = { _ in root() }
    }

    // MARK: Body
    public var body: some View {
        NavigationStack(
            path: $navigationStackCoordinator.path,
            root: { root(navigationStackCoordinator) }
        )
        .environment(\.navigationStackCoordinator, navigationStackCoordinator)
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@Observable
public final class NavigationStackCoordinator {
    // MARK: Properties
    /// `NavigationPath`.
    public var path: NavigationPath

    // MARK: Initializers
    /// Initializes `NavigationStackCoordinator`.
    public init(path: NavigationPath) {
        self.path = path
    }
}

// MARK: - Navigation Stack Coordinator Extension
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension View {
    func navigationStackCoordinator(
        _ navigationStackCoordinator: NavigationStackCoordinator
    ) -> some View {
        self
            .environment(\.navigationStackCoordinator, navigationStackCoordinator)
    }
}

// MARK: - Navigation Stack Coordinator Environment Value
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension EnvironmentValues {
    /// `NavigationStackCoordinator` of the `View` associated with the environment.
    public var navigationStackCoordinator: NavigationStackCoordinator? {
        get { self[NavigationStackCoordinatorEnvironmentKey.self] }
        set { self[NavigationStackCoordinatorEnvironmentKey.self] = newValue }
    }
}

// MARK: - Navigation Stack Coordinator Environment Key
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
private struct NavigationStackCoordinatorEnvironmentKey: EnvironmentKey {
    static let defaultValue: NavigationStackCoordinator? = nil
}

