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
            PaginationReducer { pageNumber, pageSize  in
                cardService
                    .readCardInfo(page: pageNumber, pageSize: pageSize)
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
                state.cardItemBuilder = CardItemBuilderState()
            case .actionSheetDismissed:
                state.cardItemBuilder = nil
                return .send(.pagination(.reset))
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
