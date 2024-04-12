//
//  CardItemBuilderAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - CardListItemAction

public enum CardItemBuilderAction: Equatable, BindableAction {
    
    // MARK: - Cases
    
    /// An action that calls when some item tapped
    case buttonPressed(String, String)
    
    /// Responce of the `CardService` generation method
    case cardService(Result<CardServiceAction, NSError>)
    
    // MARK: - Binding
    
    case binding(BindingAction<CardItemBuilderState>)
}
