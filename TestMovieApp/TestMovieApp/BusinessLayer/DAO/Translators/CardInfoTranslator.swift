//
//  CardInfoTranslator.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import SDAO
import Monreau

// MARK: - CardInfoTranslator

public final class CardInfoTranslator {
    
    // MARK: - Aliases
    
    public typealias PlainModel = CardInfoPlainObject
    public typealias DatabaseModel = CardInfoModelObject
    
    // MARK: - Property
    
    /// CardInfo storage
    private lazy var cardInfoStorage = RealmStorage<CardInfoModelObject>(configuration: self.configuration)
    
    /// RealConfiguration instance
    private let configuration: RealmConfiguration
    
    // MARK: - Initializers
    
    public init (configuration: RealmConfiguration) {
        self.configuration = configuration
    }
}

// MARK: - Translator

extension CardInfoTranslator: Translator {
    
    public func translate(model: DatabaseModel) throws -> PlainModel {
        CardInfoPlainObject (
            id: model.id,
            frontTitle: model.frontTitle,
            backTitle: model.backTitle
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
        databaseModel.frontTitle = plain.frontTitle
        databaseModel.backTitle = plain.backTitle
    }
}
