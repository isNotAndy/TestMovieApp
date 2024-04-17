//
//  RepeatGameState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 16.04.2024.
//

import Foundation
import ComposableArchitecture

 // MARK: - RepeatGameState

public struct RepeatGameState: Equatable {
    
    // MARK: - Properties
    
    /// Titile of `Card`
    public var title: String = ""
    
    /// Description of `Card`
    public var description: String = ""
    
    /// ID of `DeckItem`
    public let deckID: DeckPlainObject.ID
    
    /// Boolean indicating whether the description is hidden.
    public var descriptionIsHidden: Bool = true
    
    /// Array of cards to be repeated.
    public var cards: [CardPlainObject] = []
}

// MARK: - Initializers

extension RepeatGameState {
    
    public init(deckID: DeckPlainObject.ID) {
        self.deckID = deckID
    }
}
