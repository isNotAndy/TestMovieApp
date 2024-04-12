//
//  DeckItemBuilderView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import ComposableArchitecture
import SwiftUI

// MARK: - DeckItemBuilderView

struct DeckItemBuilderView: View {
    
    // MARK: - Properties

    /// The store powering the `DeckList` reducer
    public let store: StoreOf<DeckItemBuilderReducer>
    
    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                HStack {
                    TextField("Enter deck name", text: viewStore.$name)
                        .padding()
                    Button("Add Deck") {
                        viewStore.send(.buttonPressed((viewStore.name)))
                    }
                    .padding()
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}
