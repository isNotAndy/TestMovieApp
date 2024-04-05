//
//  DeckServicesMock.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import HTTPTransport
import Alamofire
import ServiceCore
import SDAO
import TCANetworkReducers

// MARK: - DeckServicesMock

public final class DeckServiceMock: WebService {
    
    // MARK: - Property
    
    /// DeckDAO instnce
    private let dao: DeckDAO
    
    /// Default initializer
    public init(transport: HTTPTransport, dao: DeckDAO) {
        self.dao = dao
        super.init(baseURL: AppConstants.Network.apiURL, transport: HTTPTransport())
    }
}

// MARK: - DeckService

extension DeckServiceMock: DeckService {
    
    public func addDeck(with title: String, and id: String , and cards: [CardPlainObject]) -> ServiceCall<DeckPlainObject> {
        createCall {
            let result = DeckPlainObject(id: id, title: title, count: 0, cards: cards)
            try! self.dao.persist(result)
            return .success(result)
        }
    }
    
    public func removeDeck(with id: DeckPlainObject.ID) {
        try! self.dao.erase(byPrimaryKey: UniqueID(rawValue: id))
    }
    
    public func editDeck(with id: DeckPlainObject.ID) {
        try! self.dao.read(byPrimaryKey: id)
    }
    
    public func readDecks() -> ServiceCall<[DeckPlainObject]?> {
        createCall {
            let cards = try! self.dao.read()
            return .success(cards)
        }
    }
}
