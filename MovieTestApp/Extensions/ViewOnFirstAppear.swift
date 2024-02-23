//
//  ViewOnFirstAppear.swift
//  MovieTestApp
//
//  Created by FRT on 23.02.24.
//

import SwiftUI

// MARK: - View on First Appear
extension View {
    public func onFirstAppear(
        perform action: (() -> Void)? = nil
    ) -> some View {
        self
            .modifier(OnFirstAppearModifier(action: action))
    }
}

// MARK: - On First Appear Modifier
private struct OnFirstAppearModifier: ViewModifier {
    // MARK: Properties
    private let action: (() -> Void)?

    @State private var didAppearForTheFirstTime: Bool = false

    // MARK: Initializers
    init(
        action: (() -> Void)?
    ) {
        self.action = action
    }

    // MARK: Body
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                if !didAppearForTheFirstTime {
                    didAppearForTheFirstTime = true
                    action?()
                }
            })
    }
}


