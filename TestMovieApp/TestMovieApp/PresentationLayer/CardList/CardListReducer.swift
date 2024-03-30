//
//  CardListReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - CardListReducer

public struct CardListReducer: Reducer {
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    // MARK: - Reducer
    
    public var body: some Reducer<CardListState, CardListAction> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case .buttonPressed(var frontSide, var backSide):
                let id = UUID().uuidString
                state.items.insert(CardItemState(
                    id: id,
                    title: frontSide,
                    description: backSide), at: 0)
                state.frontSide = ""
                state.backSide = ""
                return .none
            default:
                break
            }
            return .none
        }
    }
}
