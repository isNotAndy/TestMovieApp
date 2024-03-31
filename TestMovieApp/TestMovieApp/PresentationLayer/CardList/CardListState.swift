//
//  CardListState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - CardListState

public struct CardListState: Equatable {
    
    // MARK: - Properties
    
    /// Count of `CardItem`
    public var count: Int = 0
    
    // MARK: - Children
    
    /// An array of items representing the data to be displayed in the interactive list.
    ///
    /// The `items` property is of type `IdentifiedArrayOf<CardItemState>`, where `CardItemState` is a type
    /// describing the state of individual cells in the interactive list.
    public var items: IdentifiedArrayOf<CardItemState> = []
    
    // MARK: - Binding
    
    /// Title of card
    @BindingState public var frontSide: String = ""
    
    /// Description of card
    @BindingState public var backSide: String = ""
}
