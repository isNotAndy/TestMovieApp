//
//  DeckPlainObject.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import SDAO
import Foundation

// MARK: - DeckPlainObject

/// @realm
public struct DeckPlainObject: Codable, Equatable, Identifiable, Plain {
    
    // MARK: - Properties
    
    public var uniqueId: UniqueID {
        UniqueID(rawValue: id)
    }
    
    /// ID of deck
    public let id: String

    /// Title of deck
    public let title: String
    
    /// Count of card
    public var count: Int
    
    /// Array of `cards` in `deck`
    public var cards: [CardPlainObject]?
}
