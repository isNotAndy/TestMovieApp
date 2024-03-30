//
//  CardItemView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - CardItemView

public struct CardItemView: View {
    
    /// The store powering the `Card` feature
    public let store: StoreOf<CardItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text(viewStore.title)
                            .padding(4)
                            .bold()
                        Spacer(minLength: 0)
                    }
                    HStack(spacing: 0) {
                        Text(viewStore.description)
                            .padding(4)
                            .bold()
                        Spacer(minLength: 0)
                    }
                }
                Spacer(minLength: 0)
            }
            .onTapGesture {
                viewStore.send(.itemTapped)
            }
        }
    }
}
