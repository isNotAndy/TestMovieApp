//
//  DeskListView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - DeskListView

public struct DeskListView: View {
    
    // MARK: - Properties
    
    /// The store powering the `DeskList` reducer
    public let store: StoreOf<DeskListReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    VStack(spacing: 4) {
                        TextField("Enter name of desk", text: viewStore.$title)
                            .textFieldStyle(.roundedBorder)
                        Button {
                            viewStore.send(.buttonPressed(viewStore.title))
                        } label: {
                            Text("Add desk")
                        }
                        .padding()
                    }
                    ForEachStore(
                        store.scope(
                            state: \.items,
                            action: DeskListAction.item
                        ),
                        content: DeskItemView.init
                    )
                    .background(
                        NavigationLinkStore(
                            store.scope(
                                state: \.$cardList,
                                action: DeskListAction.cardList
                            ),
                            onTap: {viewStore.send(.deskPressed)},
                            destination: CardListView.init,
                            label: {
                                EmptyView()
                            }
                        )
                    )
                }
            }
        }
    }
}
