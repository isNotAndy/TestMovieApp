//
//  RepeatGameAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 16.04.2024.
//

import Foundation

// MARK: - RepeatGameAction

/// All available `RepeatGame` module actions.
///
/// It's a type that represents all of the actions that can happen in `RepeatGame` reducer,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the reducer. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.

public enum RepeatGameAction: Equatable {
    
    // MARK: - Cases
    
    /// An action that triggers an update to the list's items.
    case onAppear
    
    /// An action that calls when user taps on the button that show description
    case showDescription
    
    /// An action that calls when user taps on the button that show next `Card`
    case nextButtonTapped
    
    /// An action that calls when user taps on the button that show previous `Card`
    case previousButtonTapped
    
    // MARK: - Service
    
    /// Responce of the `CardService` generation method
    case cardService(Result<CardServiceAction, NSError>)
}
