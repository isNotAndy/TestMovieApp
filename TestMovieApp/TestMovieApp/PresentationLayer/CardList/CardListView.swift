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
            List {
                Section {
                    TMAPaginationView(
                        store: store.scope(
                            state: \.pagination.pagination,
                            action: CardListAction.pagination)
                    )
                    ForEachStore(
                        store.scope(
                            state: \.items,
                            action: CardListAction.item
                        ),
                        content: CardListItemView.init
                    )
                    .onDelete { viewStore.send(.deleteCardTapped($0)) }
                }
            }
            .alert(
                store.scope(state: \.alert),
                dismiss: .alertDismissed
            )
            .sheet(
                store: store.scope(
                    state: \.$cardItemBuilder,
                    action: CardListAction.cardItemBuilder
                ), onDismiss: {
                    viewStore.send(.actionSheetDismissed)
                },
                content: CardItemBuilderView.init
            )
            HStack(spacing: 0) {
                Button("Add Card") {
                    viewStore.send(.actionSheetButtonTapped)
                }
                .padding(8)
                Spacer(minLength: 0)
                Button("Repeat cards") {
                    viewStore.send(.repeatGameButtonTapped)
                }
                .padding(8)
            }
            .background(
                NavigationLinkStore(
                    store.scope(
                        state: \.$repeatGame,
                        action: CardListAction.repeatGame
                    ),
                    onTap: {},
                    destination: RepeatGameView.init,
                    label: {
                        EmptyView()
                    }
                )
            )
        }
    }
}
