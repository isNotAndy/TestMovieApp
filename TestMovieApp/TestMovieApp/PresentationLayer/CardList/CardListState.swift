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
    
    // MARK: - Binding
    
    /// Title of card
    @BindingState public var frontSide: String = ""
    
    /// Description of Card
    @BindingState public var backSide: String = ""
    
    // MARK: - Children
    
    /// An array of items representing the data to be displayed in the interactive list.
    ///
    /// The `items` property is of type `IdentifiedArrayOf<CardItemState>`, where `CardItemState` is a type
    /// describing the state of individual cells in the interactive list.
    public var items: IdentifiedArrayOf<CardItemState> = []
}
