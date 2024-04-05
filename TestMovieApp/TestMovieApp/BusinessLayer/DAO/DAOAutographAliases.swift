//
//  DAOAutographAliases.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 25.03.2024.
//

import SDAO
import Monreau

// MARK: - Aliases

/// DAO alias for  ProjectPlainObject entity
public typealias CardDAO = DAO<RealmStorage<CardModelObject>, CardTranslator>

/// DAO alias for  ProjectPlainObject entity
public typealias DeckDAO = DAO<RealmStorage<DeckModelObject>, DeckTranslator>
