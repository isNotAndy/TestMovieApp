//
//  CardItemBuilderView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import Foundation
import ComposableArchitecture
import SwiftUI

// MARK: - CardItemBuilderView

struct CardItemBuilderView: View {
    
    // MARK: - Properties

    /// The store powering the `CardList` reducer
    public let store: StoreOf<CardItemBuilderReducer>
    
    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                VStack {
                    TextField("Enter card name", text: viewStore.$frontName)
                        .padding()
                    TextField("Enter card description", text: viewStore.$backName)
                        .padding()
                    Button("Add Card") {
                        viewStore.send(.buttonPressed(viewStore.frontName, viewStore.backName))
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
