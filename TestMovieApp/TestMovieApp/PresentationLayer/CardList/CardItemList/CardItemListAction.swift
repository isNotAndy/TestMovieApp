//
//  CardItemListAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import Foundation

// MARK: - CardListAction

/// All available `CardListItem` module actions.
///
/// It's a type that represents all of the actions that can happen in `CardListItemAction` reducer,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the feature. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum CardListItemAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that calls when some item tapped
    case itemTapped
}
