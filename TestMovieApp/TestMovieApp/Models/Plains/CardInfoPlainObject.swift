//
//  CardInfoPlainObject.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import SDAO
import Foundation

// MARK: - CardInfoPlainObject

/// @realm
public struct CardInfoPlainObject: Codable, Equatable, Identifiable, Plain {
    
    // MARK: - Properties
    
    public var uniqueId: UniqueID {
        UniqueID(rawValue: id)
    }
    
    /// ID of card
    public let id: String

    /// Title of card
    public let frontTitle: String

    /// Description of card
    public let backTitle: String
}

