//
//  DeckModelObject.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import SDAO
import RealmSwift

// MARK: - DeckModelObject

public final class DeckModelObject: RealmModel {
    
    // MARK: - Properties
    
    /// ID of deck
    @objc dynamic public var id = ""

    /// Title of deck
    @objc dynamic public var title = ""

    /// Count of card
    @objc dynamic public var count = 0
}
