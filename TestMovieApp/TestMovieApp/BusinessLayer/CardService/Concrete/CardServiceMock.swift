//
//  CardServiceMock.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 04.04.2024.
//

import Foundation
import HTTPTransport
import Alamofire
import ServiceCore
import SDAO
import TCANetworkReducers

// MARK: - CardServiceMock

public final class CardServiceMock: WebService {
    
    // MARK: - Property
    
    /// CardDAO instnce
    private let dao: CardDAO
    
    /// Default initializer
    public init(transport: HTTPTransport, dao: CardDAO) {
        self.dao = dao
        super.init(baseURL: URL(fileURLWithPath: ""), transport: HTTPTransport())
    }
}

// MARK: - CardService

extension CardServiceMock: CardService {
    
    public func readCardInfo(deckID: DeckPlainObject.ID) -> ServiceCall<[CardPlainObject]> {
        createCall {
            do {
                let cardsOfDeck = try self.dao.read(predicatedBy: NSPredicate(format: "deckID == %@", deckID))
                return .success(cardsOfDeck)
            } catch {
                return .failure(error)
            }
        }
    }
    
    public func readCardInfo(page: Int, pageSize: Int, deckID: DeckPlainObject.ID) -> ServiceCall<PaginatedResponsePlainObject<CardPlainObject>> {
        createCall {
            do {
                let cardsOfDeck = try self.dao.read(predicatedBy: NSPredicate(format: "deckID == %@", deckID))
                let startIndex = (page - 1) * pageSize
                let endIndex = min(startIndex + pageSize, cardsOfDeck.count)
                let pageData = Array(cardsOfDeck[startIndex..<endIndex])
                let paginationMetadata = PaginationMetadataPlainObject(
                    totalObjectCount: cardsOfDeck.count,
                    pageCount: (cardsOfDeck.count + pageSize - 1) / pageSize,
                    currentPage: page,
                    perPage: pageSize
                )
                return .success(PaginatedResponsePlainObject(
                    pagination: paginationMetadata,
                    array: pageData
                ))
            } catch {
                return .failure(error)
            }
        }
    }
    
    public func addCardWith(id: String, deckID: DeckPlainObject.ID, frontTitle: String, backTitle: String, status: String?) -> ServiceCall<CardPlainObject> {
        createCall {
            let result = CardPlainObject(id: id, deckID: deckID, frontTitle: frontTitle, backTitle: backTitle, status: nil)
            try! self.dao.persist(result)
            return .success(result)
        }
    }
    
    public func removeCard(with id: CardPlainObject.ID) {
        try! self.dao.erase(byPrimaryKey: UniqueID(rawValue: id))
    }
}
