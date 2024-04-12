//
//  DeckItemBuilderReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import ComposableArchitecture
import Foundation

// MARK: - DeckItemBuilderReducer

public struct DeckItemBuilderReducer: Reducer {
    
    /// `DeckService` instance
    /// `@Swinjectable` deckService: DeckService
    @Swinjectable var deckService: DeckService
    
    // MARK: - Reducer
    
    public var body: some Reducer<DeckItemBuilderState, DeckItemBuilderAction> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .buttonPressed(var name):
                let id = UUID().uuidString
                name = state.name
                return deckService
                    .addDeckWith(title: name, id: id)
                    .publish()
                    .map(DeckServiceAction.sendDeckCashe)
                    .catchToEffect(DeckItemBuilderAction.deckService)
            default:
                break
            }
            return .none
        }
    }
}
