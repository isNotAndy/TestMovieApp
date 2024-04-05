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

// MARK: - DeckServicesMock

public final class DeckServicesMock: WebService {
    
    // MARK: - Property
    
    /// CardDAO instnce
    private let dao: CardDAO
    
    /// Default initializer
    public init(dao: CardDAO) {
        self.dao = dao
        super.init(baseURL: AppConstants.Network.apiURL, transport: HTTPTransport())
    }
}

// MARK: - CardService

extension DeckServicesMock: DeckService {

}
