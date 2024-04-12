//
//  CardItemListView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - CardListItemView

/// A visual representation of `CardListItem` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<CardListItemState, CardListItemAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct CardListItemView: View {
    
    // MARK: - Properties
    
    /// The store powering the `CardListItem` reducer
    public let store: StoreOf<CardListItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                HStack {
                    Text(viewStore.frontTitle)
                        .font(.headline)
                    Spacer(minLength: 4)
                }
                .frame(height: 40)
                HStack {
                    Text(viewStore.backTitle)
                        .font(.footnote)
                    Spacer(minLength: 4)
                }
                .frame(height: 40)
            }
            .onTapGesture {
                viewStore.send(.itemTapped)
            }
        }
    }
}
