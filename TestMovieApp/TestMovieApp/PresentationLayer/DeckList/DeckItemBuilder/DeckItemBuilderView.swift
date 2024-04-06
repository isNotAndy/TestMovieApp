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
                TextField("Enter deck name", text: viewStore.$name)
                    .padding()
                Button("Add Deck") {
                }
                .padding()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
        }
    }
}
