//
//  DeckItemBuilderAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeckListItemAction

public enum DeckItemBuilderAction: Equatable, BindableAction {
    
    // MARK: - Cases
    
    /// An action that calls when some item tapped
    case buttonTapped(String, String)
    
    // MARK: - Binding
    
    case binding(BindingAction<DeckItemBuilderState>)
}
