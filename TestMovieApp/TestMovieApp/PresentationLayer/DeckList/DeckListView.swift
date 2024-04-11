//
//  DeckListView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - DeckListView

public struct DeckListView: View {
    
    // MARK: - Properties
    
    /// The store powering the `DeckList` reducer
    public let store: StoreOf<DeckListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                LazyVStack {
                    Section {
                        Button("Add Deck") {
                            viewStore.send(.actionSheetButtonTapped)
                        }
                        ForEachStore(
                            store.scope(
                                state: \.items,
                                action: DeckListAction.item
                            ),
                            content: DeckListItemView.init
                        )
                        TMAPaginationView(
                            store: store.scope(
                                state: \.pagination,
                                action: DeckListAction.pagination)
                        )
                    }
                }
            }
            .sheet(
                store: store.scope(
                    state: \.$deckItemBuilder,
                    action: DeckListAction.deckItemBuilder
                ), onDismiss: {
                    viewStore.send(.actionSheetDismissed)
                },
                content: DeckItemBuilderView.init
            )
        }
    }
}
