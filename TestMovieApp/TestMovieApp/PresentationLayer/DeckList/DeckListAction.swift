//
//  DeckListAction.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import TCANetworkReducers
import ComposableArchitecture

// MARK: - DeckListAction

/// All available `DeckList` module actions.
///
/// It's a type that represents all of the actions that can happen in `DeckList` reducer,
/// such as user actions, notifications, event sources and more.
///
/// We have some actions in the reducer. There are the obvious actions,
/// such as tapping some button, holding another button, or changing a slider value.
/// But there are also some slightly non-obvious ones, such as the action of the user dismissing the alert,
/// and the action that occurs when we receive a response from the fact API request.
public enum DeckListAction: Equatable, BindableAction {
    
    // MARK: - Cases
    
    /// An action that triggers an update to the list's items.
    case onAppear
    
    /// An action that calls when user taps on the button that activates sheet
    case actionSheetButtonTapped
    
    /// An action that calls when user taps on the `dismiss` button on the sheet
    case actionSheetDismissed
    
    /// An action that triggers the deletion of one or more items from the list.
    ///  The `IndexSet` parameter specifies the indices of the items to be deleted.
    case deleteDeckTapped(IndexSet)
    
    // MARK: - Reloadable
    
    case reloadableDeck(ReloadableAction<[DeckPlainObject], DeckServiceError>)
    
    // MARK: - Children
    
    /// An action that triggers a specific action on a single item in the list.
    /// The `id` parameter specifies the unique identifier of the item,
    /// and the `action` parameter represents the specific action to be performed on the item.
    case item(id: DeckListItemState.ID, action: DeckListItemAction)
    
    /// Child action for `DeckItemBuilder` module.
    ///
    /// It's necessary as we use `Scope` reducer in current module's reducer.
    /// In short, the `DeckItemBuilder` case means that every action in `DeckItemBuilder` module
    /// will be sent to current module through it
    case deckItemBuilder(PresentationAction<DeckItemBuilderAction>)
    
    /// Child action for `CardList` module.
    ///
    /// It's necessary as we use `Scope` reducer in current module's reducer.
    /// In short, the `cardList` case means that every action in `cardList` module
    /// will be sent to current module through it
    case cardList(CardListAction)
    
    // MARK: - Pagination
    
    case pagination(PaginationAction<DeckPlainObject, DeckServiceError>)
    
    // MARK: - Binding
    
    case binding(BindingAction<DeckListState>)
}
