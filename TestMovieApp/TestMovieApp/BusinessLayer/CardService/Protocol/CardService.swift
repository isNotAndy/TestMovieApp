//
//  CardService.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 04.04.2024.
//

import Foundation
import ServiceCore
import TCANetworkReducers

// MARK: - Aliases

public typealias CardServiceError = NSError

// MARK: - CardServiceAction

public enum CardServiceAction: Equatable {
    
    // MARK: - Cases
    
    /// Retrieves card cache.
    case getCardCashe([CardPlainObject]?)
}

// MARK: - CardService

public protocol CardService {
    
    /// Function to add a card.
    /// - Returns: A service call for adding a card.
    func addCardWith(id: String, frontTitle: String, backTitle: String, status: String?) -> ServiceCall<CardPlainObject>
    
    /// Function to remove a card.
    /// - Parameter id: The ID of the card to remove.
    func removeCard(with id: CardPlainObject.ID)
    
    /// Function to edit a card.
    /// - Parameter id: The ID of the card to edit.
    func editCard(with id: CardPlainObject.ID)
    
    /// Function to read cards.
    /// - Returns: A service call for reading cards.
    func readCards() -> ServiceCall<[CardPlainObject]?>
}
