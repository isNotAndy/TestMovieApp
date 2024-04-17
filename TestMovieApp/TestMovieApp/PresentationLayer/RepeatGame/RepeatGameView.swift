//
//  RepeatGameView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 16.04.2024.
//

import Foundation
import ComposableArchitecture
import SwiftUI

// MARK: - RepeatGameView

public struct RepeatGameView: View {
    
    // MARK: - Properties
    
    /// The store powering the `RepeatGame` reducer
    public let store: StoreOf<RepeatGameReducer>
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                VStack {
                    Text(viewStore.title)
                    Text(viewStore.description)
                }
                HStack {
                    Button("Last Card") {
                        store.send(.previousButtonTapped)
                    }
                    Button("Next Card") {
                        store.send(.nextButtonTapped)
                    }
                }
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
