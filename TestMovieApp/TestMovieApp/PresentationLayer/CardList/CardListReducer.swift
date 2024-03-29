//
//  CardListReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture

public struct CardListReducer: Reducer {
    
    // MARK: - IDs
    
    private struct ItemCheckingID: Hashable {}
    
    public var body: some Reducer<CardListState, CardListAction> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .none
            case .item(id: let itemID, action: .itemTapped):
                guard let item = state.items[id: itemID] else {
                    return .none
                }
                break
            default:
                break
            }
            return .none
        }
    }
}
