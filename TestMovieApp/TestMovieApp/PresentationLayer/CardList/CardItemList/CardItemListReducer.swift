//
//  CardItemListReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import ComposableArchitecture

// MARK: - CardListItemReducer

public struct CardListItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<CardListItemState, CardListItemAction> {
        Reduce { state, action in
            switch action {
            default:
                break
            }
            return .none
        }
    }
}
