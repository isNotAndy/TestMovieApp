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
    
    public func readDeckInfo(page: Int, pageSize: Int) -> ServiceCall<PaginatedResponsePlainObject<DeckPlainObject>> {
        createCall {
            let pageData: [DeckPlainObject] = try! self.dao.read()
            let paginationMetadata = PaginationMetadataPlainObject(
                totalObjectCount: pageData.count,
                pageCount: (pageData.count + pageSize - 1) / pageSize,
                currentPage: page,
                perPage: pageSize
            )
            return .success(PaginatedResponsePlainObject(
                pagination: paginationMetadata,
                array: pageData
            ))
        }
    }
    
    public func addDeckWith(title: String, id: DeckPlainObject.ID) -> ServiceCall<DeckPlainObject> {
        createCall {
            let result = DeckPlainObject(id: id, title: title, count: 0)
            try! self.dao.persist(result)
            print(result)
            print(try! self.dao.read())
            return .success(result)
        }
    }
    
    public func removeDeck(with id: DeckPlainObject.ID) {
        try! self.dao.erase(byPrimaryKey: UniqueID(rawValue: id))
    }
    
    public func readDecks() -> ServiceCall<[DeckPlainObject]?> {
        createCall {
            do {
                let result = try self.dao.read()
                return .success(result)
            } catch {
                return .failure(error)
            }
        }
    }
}
