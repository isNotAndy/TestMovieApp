//
//  CardListView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture
import SwiftUI

public struct CardListView: View {
    
    // MARK: - Properties
    
    public let store: StoreOf<CardListReducer>
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            ForEachStore(
                store.scope(
                    state: \.items,
                    action: CardListAction.item
                ),
                content: CardItemView.init
            )
        }
    }
}
