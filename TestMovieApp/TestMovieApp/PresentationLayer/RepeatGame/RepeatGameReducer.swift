//
//  RepeatGameReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 16.04.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - RepeatGameReducer

public struct RepeatGameReducer: Reducer {
    
    /// `CardService` instance
    /// `@Swinjectable` deckService: CardService
    @Swinjectable var cardService: CardService
    
    // MARK: - Reducer
    
    public var body: some Reducer<RepeatGameState, RepeatGameAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return cardService
                    .readCardInfo(deckID: state.deckID)
                    .publish()
                    .map(CardServiceAction.cardsReaded)
                    .catchToEffect(RepeatGameAction.cardService)
            case .previousButtonTapped:
                let currentIndex = state.cards.firstIndex(where: { $0.frontTitle == state.title })
                let previousIndex = (currentIndex! - 1 + state.cards.count) % state.cards.count
                state.title = state.cards[previousIndex].frontTitle
                state.description = state.cards[previousIndex].backTitle
                return .none
            case .nextButtonTapped:
                let currentIndex = state.cards.firstIndex(where: { $0.frontTitle == state.title })
                let nextIndex = (currentIndex! + 1) % state.cards.count
                state.title = state.cards[nextIndex].frontTitle
                state.description = state.cards[nextIndex].backTitle
            case .cardService(.success(.cardsReaded(let cards))):
                state.cards = cards
                let firstCard = cards.first
                state.title = firstCard!.frontTitle
                state.description = firstCard!.backTitle
            default:
                break
            }
            return .none
        }
    }
}
