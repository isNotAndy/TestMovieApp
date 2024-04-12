//
//  CardModelObject.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation
import SDAO
import RealmSwift

// MARK: - CardModelObject

public final class CardModelObject: RealmModel {
    
    // MARK: - Properties
    
    /// ID of card
    @objc dynamic public var id = ""
    
    /// ID of deck
    @objc dynamic public var deckID = ""

    /// Title of card
    @objc dynamic public var frontTitle = ""

    /// Description of card
    @objc dynamic public var backTitle = ""
    
    /// Сard difficulty rating
    @objc dynamic public var status = ""
}
