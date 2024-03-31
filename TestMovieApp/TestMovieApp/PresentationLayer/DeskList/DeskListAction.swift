//
//  DeskListAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeskListAction

public enum DeskListAction: Equatable, BindableAction {
    
    // MARK: - Cases
    
    /// An action that triggers an update to the list's items.
    case onAppear
    
    /// Desk was pressed
    case deskPressed
    
    /// Button was pressed
    case buttonPressed(String)
    
    /// An action that triggers a specific action on a single item in the list.
    /// The `id` parameter specifies the unique identifier of the item,
    /// and the `action` parameter represents the specific action to be performed on the item.
    case item(id: DeskItemState.ID, action: DeskItemAction)
    
    // MARK: - Children
    
    /// Child action for `CardList` module.
    ///
    /// It's necessary as we use `Scope` reducer in current module's reducer.
    /// In short, the `CardList` case means that every action in `CardList` module
    /// will be sent to current module through it
    case cardList(PresentationAction<CardListAction>)
    
    // MARK: - Binding
    
    case binding(BindingAction<DeskListState>)
}
