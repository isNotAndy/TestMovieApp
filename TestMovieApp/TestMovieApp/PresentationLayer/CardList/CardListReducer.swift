//
//  CardListReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import Foundation
import ComposableArchitecture
import TCANetworkReducers
import Combine

// MARK: - CardListReducer

public struct CardListReducer: Reducer {
    
    /// `CardService` instance
    /// `@Swinjectable` deckService: CardService
    @Swinjectable var cardService: CardService
    
    // MARK: - Reducer
    
    public var body: some Reducer<CardListState, CardListAction> {
        Scope(
            state: \.pagination,
            action: /CardListAction.pagination
        ) {
             IDPaginationReducer { id, pageNumber, pageSize  in
                cardService
                    .readCardInfo(page: pageNumber, pageSize: pageSize, deckID: id)
                    .publish()
                    .delay(for: 1.5, scheduler: DispatchQueue.main.eraseToAnyScheduler())
                    .eraseToAnyPublisher()
            }
        }
        Reduce { state, action in
            switch action {
            case .pagination(.response(.success(let data))):
                state.items += IdentifiedArray(
                    uniqueElements: data.array.map(CardListItemState.init)
                )
            case .reloadableDeck(.cacheResponse(.failure(_))):
                return .none
            case .actionSheetButtonTapped:
                state.cardItemBuilder = CardItemBuilderState(deckID: state.deckID)
            case .actionSheetDismissed:
                state.cardItemBuilder = nil
                return .send(.pagination(.reset))
            case .cardItemBuilder(.presented(.buttonPressed)):
                return .send(.actionSheetDismissed)
            case .deleteCardTapped(let offsets):
                for offset in offsets {
                    let removedElement = state.items.remove(at: offset)
                    cardService.removeCard(with: removedElement.id)
                }
            default:
                break
            }
            return .none
        }
        .ifLet(\.$cardItemBuilder, action: /CardListAction.cardItemBuilder) {
            CardItemBuilderReducer()
        }
        .forEach(\.items, action: /CardListAction.item) {
            CardListItemReducer()
        }
    }
}
