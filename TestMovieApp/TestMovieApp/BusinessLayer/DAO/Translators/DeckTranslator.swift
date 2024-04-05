//
//  DeckTranslator.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import SDAO
import Monreau

// MARK: - CardTranslator

public final class DeckTranslator {
    
    // MARK: - Aliases
    
    public typealias PlainModel = DeckPlainObject
    public typealias DatabaseModel = DeckModelObject
    
    // MARK: - Property
    
    /// CardInfo storage
    private lazy var cardInfoStorage = RealmStorage<DeckModelObject>(configuration: self.configuration)
    
    /// RealConfiguration instance
    private let configuration: RealmConfiguration
    
    // MARK: - Initializers
    
    public init (configuration: RealmConfiguration) {
        self.configuration = configuration
    }
}

// MARK: - Translator

extension DeckTranslator: Translator {
    
    public func translate(model: DatabaseModel) throws -> PlainModel {
        DeckPlainObject(
            id: model.id,
            title: model.title,
            count: model.count
        )
    }
    
    public func translate(plain: PlainModel) throws -> DatabaseModel {
        let model = try cardInfoStorage.read(byPrimaryKey: plain.uniqueId.rawValue) ?? DatabaseModel()
        try translate(from: plain, to: model)
        return model
    }
    
    public func translate(from plain: PlainModel, to databaseModel: DatabaseModel) throws {
        if databaseModel.uniqueId.isEmpty {
            databaseModel.uniqueId = plain.uniqueId.rawValue
        }
        databaseModel.id = plain.id
        databaseModel.title = plain.title
        databaseModel.count = plain.count
    }
}
