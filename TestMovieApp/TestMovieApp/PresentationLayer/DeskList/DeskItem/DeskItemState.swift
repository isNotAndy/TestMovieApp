//
//  DeskItemState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeskItemState

public struct DeskItemState: Equatable, Identifiable {
    
    // MARK: - Properties
    
    /// Unique identifier
    public var id: String = ""
    
    /// Title of Desk
    public var title: String = ""
    
    /// Count of `Card` in `DeskItem`
    public var count: Int = 0
}

// MARK: - Initializers

extension DeskItemState {
    
    public init(plain: DeskInfoPlainObject) {
        self.id = plain.id
        self.title = plain.title
        self.count = plain.count
    }
}
