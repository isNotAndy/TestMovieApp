//
//  DeckListItemReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import ComposableArchitecture

// MARK: - DeckListItemReducer

public struct DeckListItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<DeckListItemState, DeckListItemAction> {
        Reduce { state, action in
            switch action {
            default:
                break
            }
            return .none
        }
    }
}
