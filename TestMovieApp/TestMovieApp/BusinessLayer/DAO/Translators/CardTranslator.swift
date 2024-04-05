//
//  CardTranslator.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import SDAO
import Monreau

// MARK: - CardTranslator

public final class CardTranslator {
    
    // MARK: - Aliases
    
    public typealias PlainModel = CardPlainObject
    public typealias DatabaseModel = CardModelObject
    
    // MARK: - Property
    
    /// Card storage
    private lazy var cardStorage = RealmStorage<CardModelObject>(configuration: self.configuration)
    
    /// RealmConfiguration instance
    private let configuration: RealmConfiguration
    
    // MARK: - Initializers
    
    public init (configuration: RealmConfiguration) {
        self.configuration = configuration
    }
}

// MARK: - Translator

extension CardTranslator: Translator {
    
    public func translate(model: DatabaseModel) throws -> PlainModel {
        CardPlainObject(
            id: model.id,
            frontTitle: model.frontTitle,
            backTitle: model.backTitle
        )
    }
    
    public func translate(plain: PlainModel) throws -> DatabaseModel {
        let model = try cardStorage.read(byPrimaryKey: plain.uniqueId.rawValue) ?? DatabaseModel()
        try translate(from: plain, to: model)
        return model
    }
    
    public func translate(from plain: PlainModel, to databaseModel: DatabaseModel) throws {
        if databaseModel.uniqueId.isEmpty {
            databaseModel.uniqueId = plain.uniqueId.rawValue
        }
        databaseModel.id = plain.id
        databaseModel.frontTitle = plain.frontTitle
        databaseModel.backTitle = plain.backTitle
    }
}
