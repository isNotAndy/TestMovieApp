//
//  CardItemReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture

public struct CardItemReducer: Reducer {
    
    public var body: some Reducer<CardItemState, CardItemAction> {
        Reduce { state, action in
            switch action {
            case .itemTapped:
                return .none
            default:
                break
            }
            return .none
        }
    }
}
