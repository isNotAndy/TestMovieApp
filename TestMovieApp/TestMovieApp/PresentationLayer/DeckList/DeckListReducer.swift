//
//  DeckListReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import ComposableArchitecture
import TCANetworkReducers
import Combine

// MARK: - DeckListReducer

public struct DeckListReducer: Reducer {
    
    /// `DeckService` instance
    /// `@Swinjectable` deckService: DeckService
    @Swinjectable var deckService: DeckService
    
    // MARK: - Reducer
    
    public var body: some Reducer<DeckListState, DeckListAction> {
        BindingReducer()
        Scope(
            state: \.pagination,
            action: /DeckListAction.pagination
        ) {
            PaginationReducer { pageNumber, pageSize  in
                deckService
                    .readDeckInfo(page: pageNumber, pageSize: pageSize)
                    .publish()
                    .delay(for: 1.5, scheduler: DispatchQueue.main.eraseToAnyScheduler())
                    .eraseToAnyPublisher()
            }
        }
        Reduce { state, action in
            switch action {
            case .pagination(.response(.success(let data))):
                state.items += IdentifiedArray(
                    uniqueElements: data.array.map(DeckListItemState.init)
                )
            case .reloadableDeck(.cacheResponse(.failure(_))):
                return .none
            case .actionSheetButtonTapped:
                state.deckItemBuilder = DeckItemBuilderState()
            case .actionSheetDismissed:
                state.deckItemBuilder = nil
                return .send(.pagination(.reset))
            case .item(id: let deckID, action: .itemTapped):
                guard let item = state.items[id: deckID] else {
                    return .none
                }
                state.isCardListActive = true
                state.cardList = CardListState(defaultCount: 0, deckID: deckID)
            case .binding(\.$isCardListActive):
                if !state.isCardListActive {
                    state.cardList = nil
                }
            case .deckItemBuilder(.presented(.buttonPressed)):
                return .send(.actionSheetDismissed)
            default:
                break
            }
            return .none
        }
        .ifLet(\.cardList, action: /DeckListAction.cardList) {
            CardListReducer()
        }
        .ifLet(\.$deckItemBuilder, action: /DeckListAction.deckItemBuilder) {
            DeckItemBuilderReducer()
        }
        .forEach(\.items, action: /DeckListAction.item) {
            DeckListItemReducer()
        }
    }
}
