//
//  TMAPaginationView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 10.04.2024.
//

import Foundation
import SwiftUI
import TCANetworkReducers
import ComposableArchitecture

// MARK: - TMAPaginationView

/// A visual representation of `TMAPaginationView` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<PaginationState, PaginationAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct TMAPaginationView<Element: Equatable & Codable, ErrorType: Error & Equatable>: View  {
    
    // MARK: - Properties
    
    public var store: Store<PaginationState<Element>, PaginationAction<Element, ErrorType>>

    // MARK: - View
    
    public var body: some View {
        PaginationView(store: store) {
            ProgressView()
                .pinTo(edge: .horizontal(.center))
            .background(Color.red)
        }
    }
}
