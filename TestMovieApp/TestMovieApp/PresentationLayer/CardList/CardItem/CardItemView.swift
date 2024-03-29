//
//  CardItemView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import SwiftUI
import ComposableArchitecture

public struct CardItemView: View {
    
    /// The store powering the `Card` feature
    public let store: StoreOf<CardItemReducer>
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text(viewStore.title)
                    Text(viewStore.description)
                }
                Spacer(minLength: 0)
            }
            .onTapGesture {
                viewStore.send(.itemTapped)
            }
        }
    }
}
