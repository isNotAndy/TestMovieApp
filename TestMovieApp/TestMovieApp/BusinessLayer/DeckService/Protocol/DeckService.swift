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
    case sendDeckCashe(DeckPlainObject)
}

// MARK: - DeckService

public protocol DeckService {
    
    /// Function to add a deck.
    /// - Returns: A service call for adding a deck.
    func addDeckWith(title: String, id: DeckPlainObject.ID) -> ServiceCall<DeckPlainObject>
    
    /// Function to remove a deck.
    /// - Parameter id: The ID of the deck to remove.
    func removeDeck(with id: DeckPlainObject.ID)
    
    /// Function to perform pagination.
    /// - Parameters:
    ///   - pageNumber: The page number.
    ///   - pageSize: The size of each page.
    /// - Returns: A service call for paginated response.
    func readDeckInfo(page: Int, pageSize: Int) -> ServiceCall<PaginatedResponsePlainObject<DeckPlainObject>>
}
