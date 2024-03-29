//
//  CardListState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture

public struct CardListState: Equatable {
    
    // MARK: - Children
    
    ///
    public var items = IdentifiedArrayOf<CardItemState>()
}
