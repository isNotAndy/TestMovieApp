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
    
    public func readCardInfo(page: Int, pageSize: Int) -> ServiceCall<PaginatedResponsePlainObject<CardPlainObject>> {
        createCall {
            let pageData: [CardPlainObject] = try! self.dao.read()
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
    
    
    public func addCardWith(id: String, frontTitle: String, backTitle: String, status: String?) -> ServiceCall<CardPlainObject> {
        createCall {
            let result = CardPlainObject(id: id, frontTitle: frontTitle, backTitle: backTitle, status: nil)
            try! self.dao.persist(result)
            return .success(result)
        }
    }
    
    public func removeCard(with id: CardPlainObject.ID) {
        try! self.dao.erase(byPrimaryKey: UniqueID(rawValue: id))
    }
    
    public func readCards() -> ServiceCall<[CardPlainObject]?> {
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
