//
//  CardItemListState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import Foundation

// MARK: - CardListItemState

/// `CardListItem` module state
///
/// Basically, `CardListItemState` is a type that describes the data
/// `CardListItem` reducer needs to perform its logic and render its UI.
public struct CardListItemState: Equatable, Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public let id: String
    
    /// FrontTitle value
    public var frontTitle: String
    
    /// Description of card
    public var backTitle: String
    
    /// Count of `CardItems`
    public var count: Int?
    
    /// Сard difficulty rating
    public var status: String?
}

// MARK: - Initializers

extension CardListItemState {
    
    public init(plain: CardPlainObject) {
        self.id = plain.id
        self.frontTitle = plain.frontTitle
        self.backTitle = plain.backTitle
        self.count = nil
    }
}
