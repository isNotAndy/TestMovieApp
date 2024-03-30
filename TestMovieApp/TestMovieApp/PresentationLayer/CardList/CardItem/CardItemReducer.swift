//
//  CardItemReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - CardItemReducer

public struct CardItemReducer: Reducer {
    
    // MARK: - Reducer
    
    public var body: some Reducer<CardItemState, CardItemAction> {
        Reduce { state, action in
            switch action {
            default:
                break
            }
            return .none
        }
    }
}
