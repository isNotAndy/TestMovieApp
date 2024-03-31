//
//  DeskInfoPlainObject.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import SDAO
import Foundation

// MARK: - DeskInfoPlainObject

/// @realm
public struct DeskInfoPlainObject: Codable, Equatable, Identifiable, Plain {
    
    // MARK: - Properties
    
    public var uniqueId: UniqueID {
        UniqueID(rawValue: id)
    }
    
    /// ID of desk
    public let id: String

    /// Title of desk
    public let title: String
    
    /// Count of card
    public var count: Int
}
