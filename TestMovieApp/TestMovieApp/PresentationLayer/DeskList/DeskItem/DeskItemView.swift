//
//  DeskItemView.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import SwiftUI
import ComposableArchitecture

// MARK: - CardItemView

public struct DeskItemView: View {
    
    // MARK: - Properties
    
    /// The store powering the `Card` feature
    public let store: StoreOf<DeskItemReducer>
    
    // MARK: - View
    
    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text(viewStore.title)
                        .padding(4)
                        .bold()
                    Text("Сards in a deck: \(viewStore.count)")
                        .padding(4)
                        .bold()
                }
                Spacer(minLength: 0)
            }
        }
    }
}
