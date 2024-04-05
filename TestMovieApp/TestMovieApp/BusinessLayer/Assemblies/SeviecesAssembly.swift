//
//  SeviecesAssembly.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import Swinject
import RealmSwift
import Monreau
import HTTPTransport

// MARK: - ServicesAssembly

public final class ServicesAssembly: CollectableAssembly {
    
    func assemble(inContainer container: Container) {
        
        // MARK: - HTTPTransport
        
        container.register(HTTPTransport.self) { resolver in
            HTTPTransport()
        }
        
        // MARK: - DeckService
        
        container.register(DeckService.self) { resolver in
            let deckDAO = container.resolve(DeckDAO.self).unsafelyUnwrapped
            let transport = container.resolve(HTTPTransport.self).unsafelyUnwrapped
            let deckServiceMock = DeckServiceMock(
                transport: transport,
                dao: deckDAO)
            return deckServiceMock
        }
        
        // MARK: - CardService
        
        container.register(CardService.self) { resolver in
            let deckDAO = container.resolve(CardDAO.self).unsafelyUnwrapped
            let transport = container.resolve(HTTPTransport.self).unsafelyUnwrapped
            let cardServicesMock = CardServiceMock(
                transport: transport,
                dao: deckDAO)
            return cardServicesMock
        }
    }
}
