//
//  CardListView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture
import SwiftUI

// MARK: - CardListView

public struct CardListView: View {
    
    // MARK: - Properties
    
    public let store: StoreOf<CardListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            List {
                VStack(spacing: 4) {
                    TextField("Enter frontSide name", text: viewStore.$frontSide)
                        .textFieldStyle(.roundedBorder)
                    TextField("Enter backSide name", text: viewStore.$backSide)
                        .textFieldStyle(.roundedBorder)
                    Text("Cards in Desk \(viewStore.count)")
                    Button {
                        viewStore.send(.buttonPressed(viewStore.frontSide, viewStore.backSide))
                    } label: {
                        Text("add card")
                    }
                    .padding()
                }
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
}
