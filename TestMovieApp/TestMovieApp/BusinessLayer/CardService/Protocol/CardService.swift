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
    case sendCardCashe(CardPlainObject)
}

// MARK: - CardService

public protocol CardService {
    
    /// Function to add a card.
    /// - Returns: A service call for adding a card.
    func addCardWith(id: String, deckID: DeckPlainObject.ID, frontTitle: String, backTitle: String, status: String?) -> ServiceCall<CardPlainObject>
    
    /// Function to remove a card.
    /// - Parameter id: The ID of the card to remove.
    func removeCard(with id: CardPlainObject.ID)
    
    /// Function to perform pagination.
    /// - Parameters:
    ///   - pageNumber: The page number.
    ///   - pageSize: The size of each page.
    /// - Returns: A service call for paginated response.
    func readCardInfo(page: Int, pageSize: Int, deckID: DeckPlainObject.ID) -> ServiceCall<PaginatedResponsePlainObject<CardPlainObject>>
}
