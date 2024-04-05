//
//  DAOAssembly.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Swinject
import SDAO
import RealmSwift
import Monreau

// MARK: - DAOAssembly

public final class DAOAssembly: CollectableAssembly {
    
    func assemble(inContainer container: Container) {
        
        // MARK: - DeckDAO
        
        container.register(DeckDAO.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            let storage = RealmStorage<DeckModelObject>(configuration: configuration)
            let translator = container.resolve(DeckTranslator.self).unsafelyUnwrapped
            return DAO(storage: storage, translator: translator)
        }
        
        // MARK: - CardDAO
        
        container.register(CardDAO.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            let storage = RealmStorage<CardModelObject>(configuration: configuration)
            let translator = container.resolve(CardTranslator.self).unsafelyUnwrapped
            return DAO(storage: storage, translator: translator)
        }
    }
}
