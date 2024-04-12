//
//  TestMovieAppApp.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 25.03.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TestMovieAppApp: App {
    
    // MARK: - Initializers
    
    init() {
        TestMovieAppAssembliesCollector.collect()
    }
    
    var body: some Scene {
        WindowGroup {
            DeckListView(
                store: Store(
                    initialState: DeckListState(defaultCount: 10),
                    reducer: DeckListReducer()
                )
            )
        }
    }
}
