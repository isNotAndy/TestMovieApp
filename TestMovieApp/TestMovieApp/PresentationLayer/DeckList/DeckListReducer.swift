//
//  DeckListReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeckListReducer

public struct DeckListReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<DeckListState, DeckListAction> {
        Reduce { state, action in
            switch action {
            case .actionSheetButtonTapped:
                state.deckItemBuilder = DeckItemBuilderState()
            case .actionSheetDismissed:
                state.deckItemBuilder = nil
            default:
                break
            }
            return .none
        }
    }
}
