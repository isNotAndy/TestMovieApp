//
//  DeckListItemAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation

// MARK: - CellAction

/// All available `DeckListItem` module actions.
///
/// It's a type that represents all of the actions that can happen in `DeckListItemAction` reducer,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum DeckListItemAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that calls when some item tapped
    case itemTapped
}
