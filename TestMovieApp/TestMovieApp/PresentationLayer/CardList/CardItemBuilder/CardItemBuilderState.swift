//
//  CardItemBuilderState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - CardItemBuilderState

public struct CardItemBuilderState: Equatable {
    
    // MARK: - Properties
    
    /// FrontName of `CardListItem`
    @BindingState public var frontName = ""
    
    /// BackName of `CardListItem`
    @BindingState public var backName = ""
    
    /// ID of deck
    public let deckID: DeckPlainObject.ID
}
