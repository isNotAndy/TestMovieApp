//
//  DeckListItemState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation

// MARK: - DeckListItemState

/// `DeckListItem` module state
///
/// Basically, `DeckListItemState` is a type that describes the data
/// `DeckListItem` reducer needs to perform its logic and render its UI.
public struct DeckListItemState: Equatable, Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public let id: String
    
    /// Title value
    public var title: String
    
    /// Count of `CardItem` in `DeckList`
    public var count: Int
}

// MARK: - Initializers

extension DeckListItemState {
    
    public init(plain: DeckPlainObject) {
        self.id = plain.id
        self.title = plain.title
        self.count = plain.count
    }
}
