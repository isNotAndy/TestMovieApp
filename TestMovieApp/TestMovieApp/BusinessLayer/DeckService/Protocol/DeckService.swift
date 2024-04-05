//
//  DeckService.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import ServiceCore
import TCANetworkReducers

// MARK: - Aliases

public typealias DeckServiceError = NSError

// MARK: - DeckServiceAction

public enum DeckServiceAction: Equatable {
    
    // MARK: - Cases
    
    /// Retrieves card cache.
    case getDeckCashe([DeckPlainObject]?)
}

// MARK: - DeckService

public protocol DeckService {
    
    /// Function to add a deck.
    /// - Returns: A service call for adding a deck.
    func addDeck(with title: String, and id: String, and cards: [CardPlainObject]) -> ServiceCall<DeckPlainObject>
    
    /// Function to remove a deck.
    /// - Parameter id: The ID of the card to remove.
    func removeDeck(with id: DeckPlainObject.ID)
    
    /// Function to edit a decks.
    /// - Parameter id: The ID of the card to edit.
    func editDeck(with id: DeckPlainObject.ID)
    
    /// Function to read decks.
    /// - Returns: A service call for reading decks.
    func readDecks() -> ServiceCall<[DeckPlainObject]?>
}
