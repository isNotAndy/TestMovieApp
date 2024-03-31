//
//  DeskItemReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeskItemReducer

public struct DeskItemReducer: Reducer {
    
    public var body: some Reducer<DeskItemState, DeskItemAction> {
        Reduce { state, action in
            switch action {
            default:
                break
            }
            return .none
        }
    }
}
