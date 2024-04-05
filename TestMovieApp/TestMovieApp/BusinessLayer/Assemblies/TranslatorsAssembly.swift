//
//  TranslatorsAssembly.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import Swinject
import Monreau

// MARK: - TranslatorsAssembly

public final class TranslatorsAssembly: CollectableAssembly {
    
    func assemble(inContainer container: Container) {
        
        // MARK: - DeckTranslator
        
        container.register(DeckTranslator.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return DeckTranslator(configuration: configuration)
        }
        
        // MARK: - CardTranslator
        
        container.register(CardTranslator.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            return CardTranslator(configuration: configuration)
        }
    }
}
