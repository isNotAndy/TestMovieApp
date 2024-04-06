//
//  DeckItemBuilderState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeckItemBuilderState

public struct DeckItemBuilderState: Equatable {
    
    // MARK: - Properties
    
    /// Name of `DeckItem`
    @BindingState public var name: String = ""
}
