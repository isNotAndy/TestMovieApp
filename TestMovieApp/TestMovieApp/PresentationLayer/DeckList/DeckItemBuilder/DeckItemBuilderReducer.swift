//
//  DeckItemBuilderReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import ComposableArchitecture

// MARK: - DeckItemBuilderReducer

public struct DeckItemBuilderReducer: Reducer {
    
    /// `DeckService` instance
    /// `@Swinjectable` deckService: DeckService
    @Swinjectable var deckService: DeckService
    
    // MARK: - Reducer
    
    public var body: some Reducer<DeckItemBuilderState, DeckItemBuilderAction> {
        Reduce { state, action in
            switch action {
            case .buttonTapped(let title, let id):
                let result = deckService.addDeckWith(title: title, id: id, cards: [CardPlainObject]())
            default:
                break
            }
            return .none
        }
    }
}
