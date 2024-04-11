//
//  CardListView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - CardListView

public struct CardListView: View {
    
    // MARK: - Properties
    
    /// The store powering the `CardList` reducer
    public let store: StoreOf<CardListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView {
                LazyVStack {
                    Section {
                        Button("Add Card") {
                            viewStore.send(.actionSheetButtonTapped)
                        }
                        ForEachStore(
                            store.scope(
                                state: \.items,
                                action: CardListAction.item
                            ),
                            content: CardListItemView.init
                        )
                        TMAPaginationView(
                            store: store.scope(
                                state: \.pagination,
                                action: CardListAction.pagination)
                        )
                    }
                }
            }
            .sheet(
                store: store.scope(
                    state: \.$cardItemBuilder,
                    action: CardListAction.cardItemBuilder
                ), onDismiss: {
                    viewStore.send(.actionSheetDismissed)
                },
                content: CardItemBuilderView.init
            )
        }
    }
}
