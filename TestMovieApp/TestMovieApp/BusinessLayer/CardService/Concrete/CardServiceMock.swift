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
    
    public func addCardWith(id: String, frontTitle: String, backTitle: String, status: String?) -> ServiceCall<CardPlainObject> {
        createCall {
            let result = CardPlainObject(id: id, frontTitle: frontTitle, backTitle: backTitle, status: status)
            try! self.dao.persist(result)
            return .success(result)
        }
    }
    
    public func removeCard(with id: CardPlainObject.ID) {
        try! self.dao.erase(byPrimaryKey: UniqueID(rawValue: id))
    }
    
    public func editCard(with id: CardPlainObject.ID) {
        try! self.dao.read(byPrimaryKey: id)
    }
    
    public func readCards() -> ServiceCall<[CardPlainObject]?> {
        createCall {
            let cards = try! self.dao.read()
            return .success(cards)
        }
    }
}
