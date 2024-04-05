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

}
