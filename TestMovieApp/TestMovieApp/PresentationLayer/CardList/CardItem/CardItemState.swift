//
//  CardItemState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Foundation

// MARK: - CardItemState

public struct CardItemState: Equatable, Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public var id: String = ""
    
    /// Title of value
    public var title: String = ""
    
    /// Description of value
    public var description: String = ""
}

// MARK: - Initializers

extension CardItemState {
    
    public init(plain: CardInfoPlainObject) {
        self.id = plain.id
        self.title = plain.frontTitle
        self.description = plain.backTitle
    }
}
