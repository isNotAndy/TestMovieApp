//
//  DeckListItemView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 07.04.2024.
//

import ComposableArchitecture
import SwiftUI

// MARK: - DeckListItemView

/// A visual representation of `DeckListItem` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<DeckListItemState, DeckListItemAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
public struct DeckListItemView: View {
    
    // MARK: - Properties
    
    /// The store powering the `DeckListItem` reducer
    public let store: StoreOf<DeckListItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            Button(action: {
                viewStore.send(.itemTapped)
            }, label: {
                HStack {
                    Text(viewStore.title)
                    Spacer(minLength: 4)
                }
            })
            .frame(height: 40)
        }
    }
}
